def validate_signal(t, y, t_ref, y_ref, num=1000, dx=20, dy=0.1):
    """ Validate a signal y(t) against a reference signal y_ref(t_ref) by creating a band
    around y_ref and finding the values in y outside the band

    Parameters:

        t       time of the signal
        y       values of the signal
        t_ref   time of the reference signal
        y_ref   values of the reference signal
        num     number of samples for the band
        dx      horizontal width of the band in samples
        dy      vertical distance of the band to y_ref

    Returns:

        t_band  time values of the band
        y_min   lower limit of the band
        y_max   upper limit of the band
        i_out   indices of the values in y outside the band
    """

    import numpy as np
    from scipy.ndimage.filters import maximum_filter1d, minimum_filter1d
    from scipy.interpolate import interp1d

    # re-sample the reference signal into a uniform grid
    t_band = np.linspace(start=t_ref[0], stop=t_ref[-1], num=num)

    # make t_ref strictly monotonic by adding epsilon to duplicate sample times
    for i in range(1, len(t_ref)):
        while t_ref[i - 1] >= t_ref[i]:
            t_ref[i] = t_ref[i] + 1e-13

    interp_method = 'linear' if y.dtype == np.float64 else 'zero'
    y_band = interp1d(x=t_ref, y=y_ref, kind=interp_method)(t_band)

    y_band_min = np.min(y_band)
    y_band_max = np.max(y_band)

    # calculate the width of the band
    if y_band_min == y_band_max:
        w = 0.5 if y_band_min == 0 else np.abs(y_band_min) * dy
    else:
        w = (y_band_max - y_band_min) * dy

    # calculate the lower and upper limits
    y_min = minimum_filter1d(input=y_band, size=dx) - w
    y_max = maximum_filter1d(input=y_band, size=dx) + w

    # find outliers
    y_min_i = np.interp(x=t, xp=t_band, fp=y_min)
    y_max_i = np.interp(x=t, xp=t_band, fp=y_max)
    i_out = np.logical_or(y < y_min_i, y > y_max_i)

    # do not count outliers outside the t_ref
    i_out = np.logical_and(i_out, t > t_band[0])
    i_out = np.logical_and(i_out, t < t_band[-1])

    return t_band, y_min, y_max, i_out


def validate_result(result, workdir, model):

    from pathlib import Path
    import numpy as np
    import plotly.graph_objects as go
    from plotly.subplots import make_subplots
    from pymola import Dsres
    from scipy.io import wavfile

    if model == 'Arduino.Examples.ToneMelody':
        sample_rate, _ = wavfile.read(workdir / 'melody.wav')
        assert sample_rate == 44100

    results = Path(__file__).parent / 'results'

    filename = results / f'{model}.mat'

    if not filename.exists():
        return True

    reference = Dsres(filename)

    t = result['Time']
    t_ref = reference['Time']

    figure = make_subplots(rows=len(reference._names) - 1, cols=1, shared_xaxes=True)

    passed = True

    for i, name in enumerate(reference._names[1:]):
        y = result[name]
        y_ref = reference[name]

        t_band, y_min, y_max, i_out = validate_signal(t, y, t_ref, y_ref, num=10000, dx=200, dy=0.05)

        passed = passed and not np.any(i_out)

        trace1 = go.Scatter(x=np.concatenate([t_band, t_band[::-1]]),
                            y=np.concatenate([y_min, y_max[::-1]]),
                            fill='toself',
                            line_color='green',
                            name=f'{name}_ref')
        trace2 = go.Scatter(x=t, y=y, line_color='blue', name=name)

        figure.add_trace(trace1, row=i + 1, col=1)
        figure.add_trace(trace2, row=i + 1, col=1)

    figure.write_html(workdir / f'{model}.html')

    return passed