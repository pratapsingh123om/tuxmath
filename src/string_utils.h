#ifndef STRING_UTILS_H
#define STRING_UTILS_H

#include <wchar.h>
#include <stdlib.h>
#include <string.h>
#include "t4k_common.h"
#include "t4k_defines.h"

// Convert a regular string to a wide string
static inline wchar_t* to_wchar(const char* str) {
    return T4K_ConvertFromUTF8(str);
}

// Convert a wide string to a regular string
static inline char* to_char(const wchar_t* wstr) {
    return T4K_ConvertToUTF8(wstr);
}

// Free a string that was allocated by to_wchar or to_char
static inline void free_str(void* str) {
    free(str);
}

// Concatenate two wide strings
static inline wchar_t* wstr_concat(const wchar_t* s1, const wchar_t* s2) {
    if (!s1 || !s2) return NULL;
    size_t len1 = wcslen(s1);
    size_t len2 = wcslen(s2);
    wchar_t* result = (wchar_t*)malloc((len1 + len2 + 1) * sizeof(wchar_t));
    if (!result) return NULL;
    wcscpy(result, s1);
    wcscat(result, s2);
    return result;
}

#endif // STRING_UTILS_H 