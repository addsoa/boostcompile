# Boost �������
## ����
### ����
[VirtualBox](https://www.virtualbox.org/) + [ubuntu 20 live server amd64 iso](https://mirrors.zju.edu.cn/ubuntu-releases/20.04.5/ubuntu-20.04.5-live-server-amd64.iso).
### �������
#### ����
* ����һ��host-only������
* �������ssh���ʣ�����host-only����
```bash
$ sudo ifconfig enp0s8 up
$ sudo ifconfig enp0s8 [some ip, e.g. 192.168.0.100]
```
#### �����ļ���
��VirtualBox�������������Ժ���linux������

```
$ sudo apt install virtualbox-guest-utils
$ sudo mount -t vboxsf [name configured in host] [directory created]
```
#### һЩ����

```
$ sudo apt-get install unzip
$ sudo apt-get install ip-utils
```
�ο�

* [����](https://gist.github.com/estorgio/1d679f962e8209f8a9232f7593683265)
* [����](https://askubuntu.com/questions/1355061/shared-folder-was-not-found-vboxsf)

## ����
### Ŀ¼�ṹ

|�û�Ŀ¼|��Ŀ¼|��Ŀ¼|˵��|
|---|---|---||---|
|/home/user1/||||
||tools||for toolchains|
||tools|sdksrcs|sdkԴ����|
||tools|toolchains|sdkԴ�������ṹ��Ӧ�ÿ��ļ�����toolchain|
||tools|scripts|����ű�|
||workspaces||Ӧ�ÿ⹤������|
||workspaces|packages|���ص�ѹ���ļ�|
||workspaces|libs|Ӧ�ÿ������|
||workspaces|boost_1_75_0|��Ҫ�����Դ����|

### ��������

Boost �ο�[build_boost_testios.sh](./scripts/build_boolst_testios.sh):

``` bash
cd $BOOST_SRC_PATH; ./tools/build/b2  \         # b2Ϊboost�ı��빤��
    cxxflags="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot $IOS_SDK_PATH " \
    cflags="-fPIC" \                            # cxxflags��cflags������Ӽ�
    linkflags="-isysroot $IOS_SDK_PATH " \      # ͬ��
    define=BOOST_THREAD_TEST=1 \                # -D
    toolset=clang-testios \                     # 1.
    target-os=iphone \                          # 2.
    architecture=arm \                          # 3. ��3�����ף�Ҫ�ͱ���Ŀ��һ��
    variant=release \                           # release��debug �汾
    --layout=versioned \ 
    threading=multi \ 
    threadapi=pthread \
    link=static \                               # 1.
    runtime-link=static \                       # 2. ��2�����ף���ʾ����.a�ļ�
    --stagedir=$BOOST_STAGE_PATH \              # ������Ŀ¼
    --with-atomic \                             # ��Ҫ����Ŀ⣬�� --with-date_time
    --with-filesystem \
    -d2                                         # debug log �ȼ���һ��d1��d2�Ѿ��Ƚ���ϸ

```

�������òο���[b2](https://www.boost.org/doc/libs/1_80_0/tools/build/doc/html/index.html#_introduction)
## ���뻷������
### ���빤�߰�װ

``` bash
$ sudo apt-get upgrade
$ sudo apt-get install bison zip unzip python clang cmake libssl-dev lzma-dev libxml2-dev llvm-dev uuid-dev 
```
### toolchains
#### android

1. ����[android-ndk-r21e-linux-x86_64.zip](https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip)
2. [buildtoolchain_android.sh](./scripts/env_cross/buildtoolchain_android.sh)
3.  [How to compile a static library using the android ndk](https://stackoverflow.com/questions/2943828/how-to-compile-a-static-library-using-the-android-ndk)
4.  [�ű���Դ](https://gist.github.com/enh/b2dc8e2cbbce7fffffde2135271b10fd)

#### mac

1. ���� __osxcross__ ����

* https://github.com/tpoechtrager/osxcross.git
* https://github.com/tpoechtrager/xar.git
* https://github.com/tpoechtrager/apple-libtapi.git
* https://github.com/tpoechtrager/cctools-port.git

2. [��mini���sdkԴ](https://github.com/tpoechtrager/osxcross#packaging-the-sdk)
3. ������õ�Mac**.tar.gz �ŵ�osxcross-master/tarball/Ŀ¼��
4. [buildtoolchain_mac.sh](./scripts/env_cross/buildtoolchain_mac.sh)

#### ios

1. ���ش���

* https://github.com/tpoechtrager/apple-libtapi.git
* https://github.com/tpoechtrager/cctools-port.git
* https://github.com/tpoechtrager/ldid.git

2. [���sdkԴ������](https://docs.godotengine.org/en/stable/development/compiling/cross-compiling_for_ios_on_linux.html)
3. [boosttoolchain_ios.sh](./scripts/env_cross/buildtoolchain_ios.sh)

#### ios simulator
ͬios
### toolchain ����
����[boost project-config.jam](./scripts/env_cross/boost75/project-config.jam)
### ����
һЩsdk���߲��ܴ�����ļ������±���ʧ�ܵ�������Ŀǰ��Ҫ����makefile�ļ�������Щ�ļ���
### �ο�
* https://github.com/tpoechtrager/osxcross
* https://crosstool-ng.github.io/docs/introduction/
* https://github.com/tpoechtrager/cctools-port/tree/master/cctools
* https://github.com/faithfracture/Apple-Boost-BuildScript/blob/master/boost.sh
* [mac�ϱ���ios](./boostcompile.md)