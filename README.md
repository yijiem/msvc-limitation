# msvc-limitation

Compile with MSVC 19.32.31332 (Visual Studio 2022 version 17.2)

```
>cl.exe /c async_service.cpp
Microsoft (R) C/C++ Optimizing Compiler Version 19.32.31332 for x64
Copyright (C) Microsoft Corporation.  All rights reserved.

async_service.cpp
async_service.cpp(1804): fatal error C1202: recursive type or function dependency context too complex
async_service.cpp(1804): note: This diagnostic occurred in the compiler generated function 'Async_Method250<Async_Method251<Async_Method252<Async_Method253<Async_Method254<Async_Method255<Async_Method256<Async_Method257<Async_Method258<Async_Method259<Async_Method260<Async_Method261<Async_Method262<Async_Method263<Async_Method264<Async_Method265<Async_Method266<Async_Method267<Async_Method268<Async_Method269<Async_Method270<Async_Method271<Async_Method272<Async_Method273<Async_Method274<Async_Method275<Async_Method276<Async_Method277<Async_Method278<Async_Method279<Async_Method280<Async_Method281<Async_Method282<Async_Method283<Async_Method284<Async_Method285<Async_Method286<Async_Method287<Async_Method288<Async_Method289<Async_Method290<Async_Method291<Async_Method292<Async_Method293<Async_Method294<Async_Method295<Async_Method296<Async_Method297<Async_Method298<Async_Method299<Async_Method300<Service>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>::Async_Method250(void)'
async_service.cpp(1798): note: see reference to function 'Async_Method250<Async_Method251<Async_Method252<Async_Method253<Async_Method254<Async_Method255<Async_Method256<Async_Method257<Async_Method258<Async_Method259<Async_Method260<Async_Method261<Async_Method262<Async_Method263<Async_Method264<Async_Method265<Async_Method266<Async_Method267<Async_Method268<Async_Method269<Async_Method270<Async_Method271<Async_Method272<Async_Method273<Async_Method274<Async_Method275<Async_Method276<Async_Method277<Async_Method278<Async_Method279<Async_Method280<Async_Method281<Async_Method282<Async_Method283<Async_Method284<Async_Method285<Async_Method286<Async_Method287<Async_Method288<Async_Method289<Async_Method290<Async_Method291<Async_Method292<Async_Method293<Async_Method294<Async_Method295<Async_Method296<Async_Method297<Async_Method298<Async_Method299<Async_Method300<Service>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>::Async_Method250(void)'
```

No issue if set `COUNTER` in [generate.sh](generate.sh) to a smaller value (e.g. 200). No issue when compiling with clang (version 14.0.6) on Linux.

Seems like when the nested template level (`Async_Method1<Async_Method2<Async_Method3<...>>>`) is >= 250, MSVC will generate the above error.
