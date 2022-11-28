# boost�ı���
* ����[boost_1_75](https://boostorg.jfrog.io/artifactory/main/release/1.75.0/source/boost_1_75_0.tar.bz2)
* Ŀǰֻ�����˾�̬��������
* [���Դ���](./testbuild/)
## Android
### ����
[VirtualBox](https://www.virtualbox.org/) + [ubuntu 20 live server amd64 iso](https://mirrors.zju.edu.cn/ubuntu-releases/20.04.5/ubuntu-20.04.5-live-server-amd64.iso).

��Vmware���Թ�����ubuntu-desktop�������С�û���Թ�Virtualbox + ubuntu server����ϡ���֮��ͼ�ν����desktop���ձȽϴ�

#### һЩ����
* ����һ��host-only������

![interface](./images/network1.png)

* �����ļ���
��VirtualBox�������������Ժ���linux������

```
$ sudo apt install virtualbox-guest-utils
$ sudo mount -t vboxsf [name configured in host] [directory created]
```
* һЩ����

```
$ sudo apt-get install unzip
$ sudo apt-get install ip-utils
```
�ο�

* [����](https://gist.github.com/estorgio/1d679f962e8209f8a9232f7593683265)
* [����](https://askubuntu.com/questions/1355061/shared-folder-was-not-found-vboxsf)

### ����
* ��װlinux ���빤��

```
$ sudo apt-get install build-essential linux-headers-`uname -r`
```

* ��װandroid ���빤��, ֱ�ӽ�ѹ����

```
$ wget https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip
```


* �ҵı��뻷��Ŀ¼�ṹ������

![files](./images/files.png)


* ����ű����� [gist](https://gist.github.com/enh/b2dc8e2cbbce7fffffde2135271b10fd), �޸Ĳ�ʹ�õĽű�: [test_aarch.sh](./env_vm_mac//scripts/test_aarch.sh)��

* �������� **boost_1_75_0/stage/lib/**

### ����
* ��װ [android studio](https://developer.android.com/studio).

* [����һ��c++��Ŀ](https://developer.android.com/studio/projects/add-native-code)

* [����һ�������豸](https://developer.android.com/studio/run/managing-avds#skins), ѡ����豸���ͣ�̫�߰汾��x86ģ�ⲻ��arm��̫�Ͱ汾�Ĳ���**v8a**
![device](./images/device1.png)

## MacOS
### �������
��ubuntu�����
* ��clang-darwin���ڳ�����mac�ϲ���ʶ��
* ��darwin-clang��û��darwin������darwinĬ��macOS����������һ�£���linux�ϴ�������������������û�����ο���
* �����ȸ�ios���������
### ��Mac mini��
��̨�����Ѿ�װ����Xcode��ֱ�ӾͿ��Ա���[test_mac](./env_vm_mac/scripts/test_mac.sh), ʵ����ʹ�õ�toolset=clang-darwin131

## iphone simulator
������Mac mini + Xcode.14 + iphonesimilator sdk 15.4
### ����
* ����toolset����[project-config.jam](./env_vm_mac//scripts/project-config.jam) ���� __boost_$VER/__ Ŀ¼��
* �� __boost_$VER/__ ����[test_iphonesim.sh](./env_vm_mac//scripts/test_iphonesim.sh)
* *.a�ļ������� __boost_$VER/stage/lib
### ����
* ��Xcode������һ��__Object-C__��Hello World��Ŀ��������Ŀ���� **1234**
* ��__Frameworks__�ļ���ѡ������ļ�����Ŀ��ѡ��libboost_xx.a���
* ���롣Xcode�ܹ�ʶ����ļ�������汾���Իᱨ�����ơ�...libboost_xxx.a��ΪMACOS�����...��
* ���Ҫ�����н����Ҫ��.h��.a�ļ����õ���Ŀ�С������ǲ���ȷ�������õķ�����
	1. ��.h�ļ��ŵ�iPhoneSimulatorĬ��·��
	``` bash
	$ cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/include 
	$ sudo mkdir boost; cd boost
	$ sudo cp -rf __boost_$VER/boost/* ./
	```
	2. ��.a�ļ���������ĿĬ��·����Ĭ��·���� __/Users/bsl/Library/Developer/Xcode/DerivedData/��Ŀ��-����/Build/Products/Debug-iphonesimulator/__

## С��
Ŀǰboost�����˼·��Ҫ�ǣ�

1. ��װsdk
2. дproject-config.jam�ļ�����toolset��Ҳ����ָ��������
3. дbuild_xx.sh�ļ�����Ҫ����һЩ���ɿ�����,flags��Ŀ¼

�������˼·����Ҫ��������SDK������MAC�ǲ����п�����Ubuntu���ܵ�SDK����������ԣ���ôҪ�о�һ��llvm���Ҳ����������չ�ᵽһ���������Apple�ǲ����ṩ�ڱ��OS���ܵĺ�˱��빤�ߡ�

## �ο�
* [clang: libc++](https://stackoverflow.com/questions/8486077/how-to-compile-link-boost-with-clang-libc)
* [clang��װ](https://stackoverflow.com/questions/39332406/install-libc-on-ubuntu)
* [mac: visibility](https://stackoverflow.com/questions/8685045/xcode-with-boost-linkerid-warning-about-visibility-settings)
* [lipo](https://blog.csdn.net/qq_33053671/article/details/106388313)
* [compilers](https://www.alibabacloud.com/blog/gcc-vs--clangllvm-an-in-depth-comparison-of-cc%2B%2B-compilers_595309)
* [clang](https://clang.llvm.org/get_started.html)
* [llvm](https://llvm.org/docs/GettingStarted.html#requirements)
* [Apple-Boost-BuildScript](https://github.com/faithfracture/Apple-Boost-BuildScript)
* [Boost��ƽ̨����](https://developer.aliyun.com/article/252857#slide-1)