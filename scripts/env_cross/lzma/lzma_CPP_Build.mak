LIBS = $(LIBS) oleaut32.lib ole32.lib

ifndef MY_NO_UNICODE
#CFLAGS = $(CFLAGS) -DUNICODE -D_UNICODE
CFLAGS := $(CFLAGS) -DUNICODE -D_UNICODE
endif

#IFNDEF O
#!IFDEF PLATFORM
ifndef O
ifdef PLATFORM
O=$(PLATFORM)
else
#!ELSE
O=o
endif
endif
#!ENDIF
#!ENDIF

#!IF "$(CC)" != "clang-cl"
ifneq ($(CC), "clang-cl")
#CFLAGS = $(CFLAGS) -FAsc -Fa$O/asm/
CFLAGS += -FAsc -Fa$O/asm/
endif
#!ENDIF

ifeq ($(PLATFORM), "x64")
#!IF "$(PLATFORM)" == "x64"
MY_ML = ml64 -WX
#-Dx64
#!ELSEIF "$(PLATFORM)" == "arm"
else ifeq ($(PLATFORM), "arm") 
MY_ML = armasm -WX
#!ELSE
else
MY_ML = ml -WX
# -DABI_CDECL
endif
#!ENDIF

# MY_ML = "$(MY_ML) -Fl$O\asm\


#!IFDEF UNDER_CE
ifdef UNDER_CE
RFLAGS = $(RFLAGS) -dUNDER_CE
ifdef MY_CONSOLE
#!IFDEF MY_CONSOLE
LFLAGS = $(LFLAGS) /ENTRY:mainACRTStartup
endif
else
#!ENDIF
#!ELSE
ifdef OLD_COMPILER
#!IFDEF OLD_COMPILER
LFLAGS = $(LFLAGS) -OPT:NOWIN98
#!ENDIF
endif
#!IF "$(PLATFORM)" != "arm" && "$(PLATFORM)" != "arm64"
ifneq ($(PLATFORM), "arm")
ifneq ($(PLATFORM), "arm64")
#-Gr: for x86 fastcall. cc/gcc has no compiler flag for it, don't know if clang supports
#CFLAGS := $(CFLAGS) -Gr
CFLAGS := $(CFLAGS) 
#!ENDIF
endif
endif
LIBS = $(LIBS) user32.lib advapi32.lib shell32.lib
#!ENDIF
endif

ifeq ($(PLATFORM), "arm")
#!IF "$(PLATFORM)" == "arm"
COMPL_ASM = $(MY_ML) $** $O/$(*B).obj
else
#!ELSE
COMPL_ASM = $(MY_ML) -c -Fo$O/ $**
endif
#!ENDIF

#CFLAGS := $(CFLAGS) -nologo -c -Fo$O/ -W4 -WX -EHsc -Gy -GR- -GF
#TODO: deal with GR-: remvoe runtime type information
#-EHsc: exception catch
#-GR-: -fno-rtti
#-GF: eliminate duplicate strings
#-Gy: -ffunction-sections, and ld's -Wl,--gc-sections //Not necessary
#-W4: warning level
#-WX: treat warning as error
#-nologo: about display of logo //Not required
CFLAGS := $(CFLAGS) -c -Fo$O/ -Wall -Werror  -fno-rtti 

#!IF "$(CC)" == "clang-cl"
ifeq ($(CC), "clang-cl")

CFLAGS := $(CFLAGS) \
  -Werror \
  -Wextra \
  -Wall \
  -Weverything \
  -Wno-extra-semi-stmt \
  -Wno-extra-semi \
  -Wno-zero-as-null-pointer-constant \
  -Wno-sign-conversion \
  -Wno-old-style-cast \
  -Wno-reserved-id-macro \
  -Wno-deprecated-dynamic-exception-spec \
  -Wno-language-extension-token \
  -Wno-global-constructors \
  -Wno-non-virtual-dtor \
  -Wno-deprecated-copy-dtor \
  -Wno-exit-time-destructors \
  -Wno-switch-enum \
  -Wno-covered-switch-default \
  -Wno-nonportable-system-include-path \
  -Wno-c++98-compat-pedantic \
  -Wno-cast-qual \
  -Wc++11-extensions \

#!ENDIF
endif

ifdef MY_DYNAMIC_LINK
#!IFDEF MY_DYNAMIC_LINK
#CFLAGS = $(CFLAGS) -MD
CFLGAS += -MD
#!ELSE
else
#!IFNDEF MY_SINGLE_THREAD
ifndef MY_SINGLE_THREAD
#TODO: MT: for multi-thread 	
#CFLAGS = $(CFLAGS) -MT
#CFLAGS += -MT
#!ENDIF
endif
endif
#!ENDIF


#CFLAGS = $(CFLAGS_COMMON) $(CFLAGS)
CFLAGS += $(CFLAGS_COMMON)

#!IFNDEF OLD_COMPILER
ifndef OLD_COMPILER
#CFLAGS = $(CFLAGS) -GS- -Zc:forScope -Zc:wchar_t
#CFLAGS += -GS-
#TODO: For buffer security guard. seemed similar but not sure
CFLAGS += -fno-stack-protector
#Zc:forScope, a MC unique extension
#CFLAGS += -Zc:forScope
#For wchar_t, to be tested
#CFLAGS += -Zc:wchar_t
#!IFNDEF UNDER_CE
ifndef UNDER_CE
#!IF "$(CC)" != "clang-cl"
ifeq ($(CC), "clang-cl")
#CFLAGS = $(CFLAGS) -MP4
CFLAGS += -MP4
#!ENDIF
endif
#!IFNDEF PLATFORM
ifndef PLATFORM
# CFLAGS = $(CFLAGS) -arch:IA32
#CFLAGS += -arch:IA32
CFLAGS += --arch=ia32
#!ENDIF
endif
endif
#!ENDIF
#!ELSE
else
CFLAGS = $(CFLAGS)
#!ENDIF
endif

#!IFDEF MY_CONSOLE
ifdef MY_CONSOLE
CFLAGS = $(CFLAGS) -D_CONSOLE
#!ENDIF
endif

#!IFNDEF UNDER_CE
ifndef UNDER_CE
#!IF "$(PLATFORM)" == "arm"
ifeq ($(PLATFORM), "arm")
CFLAGS = $(CFLAGS) -D_ARM_WINAPI_PARTITION_DESKTOP_SDK_AVAILABLE
#!ENDIF
#!ENDIF
endif
endif

#!IF "$(PLATFORM)" == "x64"
ifeq ($(PLATFORM), "x64")
CFLAGS_O1 = $(CFLAGS) -O1
else
#!ELSE
CFLAGS_O1 = $(CFLAGS) -O1
endif
#!ENDIF
CFLAGS_O2 = $(CFLAGS) -O2

LFLAGS = $(LFLAGS) -nologo -OPT:REF -OPT:ICF

#!IFNDEF UNDER_CE
ifndef UNDER_CE
LFLAGS = $(LFLAGS) /LARGEADDRESSAWARE
#!ENDIF
endif

#!IFDEF DEF_FILE
ifdef DEF_FILE
LFLAGS = $(LFLAGS) -DLL -DEF:$(DEF_FILE)
#!ELSE
else
#!IF defined(MY_FIXED) && "$(PLATFORM)" != "arm" && "$(PLATFORM)" != "arm64"
ifdef My_FIXED
	ifneq ($(PLATFORMA), "arm")
		ifneq ($(PLATFORM), "arm64")
			LFLAGS = $(LFLAGS) /FIXED
		endif
	endif		
else	
	LFLAGS = $(LFLAGS) /FIXED:NO
endif	
# /BASE:0x400000
#!ENDIF
endif


# !IF "$(PLATFORM)" == "x64"

#!IFDEF SUB_SYS_VER
ifdef SUB_SYS_VER

MY_SUB_SYS_VER=5.02

#!IFDEF MY_CONSOLE
ifdef MY_CONSOLE
LFLAGS = $(LFLAGS) /SUBSYSTEM:console,$(MY_SUB_SYS_VER)
#!ELSE
else
LFLAGS = $(LFLAGS) /SUBSYSTEM:windows,$(MY_SUB_SYS_VER)
#!ENDIF
endif

#!ENDIF
endif


PROGPATH = $O\$(PROG)

COMPL_O1   = $(CC) $(CFLAGS_O1) $**
COMPL_O2   = $(CC) $(CFLAGS_O2) $**
COMPL_PCH  = $(CC) $(CFLAGS_O1) -Yc"StdAfx.h" -Fp$O/a.pch $**
COMPL      = $(CC) $(CFLAGS_O1) -Yu"StdAfx.h" -Fp$O/a.pch $**

COMPLB    = $(CC) $(CFLAGS_O1) -Yu"StdAfx.h" -Fp$O/a.pch $<
# COMPLB_O2 = $(CC) $(CFLAGS_O2) -Yu"StdAfx.h" -Fp$O/a.pch $<
COMPLB_O2 = $(CC) $(CFLAGS_O2) $<

CFLAGS_C_ALL = $(CFLAGS_O2) $(CFLAGS_C_SPEC)
CCOMPL_PCH  = $(CC) $(CFLAGS_C_ALL) -Yc"Precomp.h" -Fp$O/a.pch $**
CCOMPL_USE  = $(CC) $(CFLAGS_C_ALL) -Yu"Precomp.h" -Fp$O/a.pch $**
CCOMPL      = $(CC) $(CFLAGS_C_ALL) $**
CCOMPLB     = $(CC) $(CFLAGS_C_ALL) $<

#!IF "$(CC)" == "clang-cl"
ifeq ($(CC), "clang-cl")
COMPL  = $(COMPL) -FI StdAfx.h
COMPLB = $(COMPLB) -FI StdAfx.h
CCOMPL_USE = $(CCOMPL_USE) -FI Precomp.h
#!ENDIF
endif

all: $(PROGPATH)

clean:
	-del /Q $(PROGPATH) $O\*.exe $O\*.dll $O\*.obj $O\*.lib $O\*.exp $O\*.res $O\*.pch $O\*.asm

#$O:
#	echo " $O"
#	if [not exist $O]; then mkdir -p $O; fi
#$O/asm:
#	if [not exist $O/asm]; then mkdir -p $O/asm; fi
$(O):
	mkdir $O
$(O)/asm:
	mkdir $O/asm

$(PROGPATH): $O $O/asm $(OBJS) $(DEF_FILE)
	link $(LFLAGS) -out:$(PROGPATH) $(OBJS) $(LIBS)

#!IFNDEF NO_DEFAULT_RES
ifndef NO_DEFAULT_RES
$O\resource.res: $(*B).rc
	rc $(RFLAGS) -fo$@ $**
#!ENDIF
endif
$O\StdAfx.obj: $(*B).cpp
	$(COMPL_PCH)
