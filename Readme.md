#  FidelityFX-FSR2 for Linux

https://github.com/GPUOpen-Effects/FidelityFX-FSR2

# Windows

run build/GenerateSolutions.bat

build DX12/ALL_BUILD.vcxproj

rename in src/ffx-fsr2-api/vk/shaders/ffx_fsr2_shaders_vk:

fsr2GetPermutationBlobByIndex() to fsr2GetPermutationBlobByIndexVK()

build VK/ALL_BUILD.vcxproj

libraries:
bin/ffx_fsr2_api/

# Linux

copy build directory from Windows

add into src/ffx-fsr2-api/ffx_types.h:

```
#include <locale>
#include <wchar.h>
#define _countof(NAME) (sizeof(NAME) / sizeof(NAME[0]))
```

make && make install
