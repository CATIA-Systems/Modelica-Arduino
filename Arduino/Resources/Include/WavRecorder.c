#include <stdio.h>
#include <stdlib.h>

#include "ModelicaUtilities.h"

/* make sure all compiler use the same alignment policies for structures */
#if defined _MSC_VER || defined __GNUC__
#pragma pack(push,2)
#endif

typedef struct {
    char           formatID[4];
    unsigned long  fileSize;
    char           riffType[4];
    char           chunkID[4];
    unsigned long  extData;       // extension data
    unsigned short formatTag;     // PCM - integer samples
    unsigned short channels;      // 1 (mono) or 2 (stereo)
    unsigned long  samplesPerSec; // samples per second (Hz)
    unsigned long  bytesPerSec;   // (Sample Rate * BitsPerSample * Channels) / 8
    unsigned short blockAlign;    // data block size (size of two integer samples, one for each channel, in bytes)
    unsigned short bitsPerSample; // number of bits per sample (use a multiple of 8)
    char           dataID[4];
    unsigned long  dataSize;
} WavHeader;

typedef struct {
    FILE*       file;
    long        n_samples;
    WavHeader   header;
} WavFile;

/* reset alignment policy to the one set before reading this file */
#if defined _MSC_VER || defined __GNUC__
#pragma pack(pop)
#endif

void* WavRecorder_create(const char* filename) {

    WavFile* speaker = (WavFile*)malloc(sizeof(WavFile));

    if (!speaker) {
        ModelicaFormatError("Failed to allocate memory for WAV file recorder.");
        return NULL;
    }

    speaker->file = fopen(filename, "wb");  // w for write, b for binary
    
    if (!speaker->file) {
        ModelicaFormatError("Failed to open \"%s\" for writing.", filename);
        return NULL;
    }

    speaker->header = (WavHeader){
        .formatID      = "RIFF",
        .fileSize      = 0,
        .riffType      = "WAVE",
        .chunkID       = "fmt ",
        .extData       = 16,
        .formatTag     = 1,
        .channels      = 1,
        .samplesPerSec = 44100,
        .bytesPerSec   = 88200,
        .blockAlign    = 4,
        .bitsPerSample = 16,
        .dataID        = "data",
        .dataSize      = 0
    };

    speaker->n_samples = 0;

    fseek(speaker->file, sizeof(WavHeader), SEEK_SET);

    return speaker;
}

void WavRecorder_free(void* object) {

    WavFile* speaker = (WavFile*)object;

    // (We'll need the final file size to fix the chunk sizes above)
    const long file_length = ftell(speaker->file);

    speaker->header.fileSize = file_length - 8;

    // Fix the file header to contain the proper RIFF chunk size, which is (file size - 8) bytes
    fseek(speaker->file, 0, SEEK_SET);

    fwrite(&speaker->header, sizeof(WavHeader), 1, speaker->file);

    fclose(speaker->file);

    free(speaker);
}

void WavRecorder_sample(void* object, double time, double value) {

    WavFile* speaker = (WavFile*)object;
    
    unsigned short s = value * SHRT_MAX;

    const size_t last_sample = time * speaker->header.samplesPerSec;

    while (speaker->n_samples < last_sample) {
        fwrite(&s, sizeof(s), 1, speaker->file);
        speaker->n_samples++;
        speaker->header.dataSize += sizeof(unsigned short);
    }
}
