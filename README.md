# zsh php version changer

## Preview

### change version

![change](images/change.png)

### suggest install

![install](images/install.png)

## Support OS

- macOS
- ubuntu (with ondrej ppa, require root permission)

## Install

```zsh
zsh < <(curl -s -S -L https://raw.githubusercontent.com/kkame/zsh-php-version-changer/main/install.sh)
```

## 어떻게 동작하나요?

1. 터미널을 열거나 디렉토리를 이동하는 경우 해당 위치에서 composer.json 파일이 존재하는지 확인합니다.
2. composer.json에 명시된 패키지 이름을 출력합니다.
3. composer.json 에 명시된 php의 최소버전을 체크하여 OS 에 설치된 php버전에 맞도록 설정을 임시 또는 직접적으로 변경합니다.
    - macOS의 경우 임시로 PATH를 추가하기 때문에 터미널을 닫을 경우 원래의 설정으로 돌아갑니다
    - ubuntu의 경우 시스템 설정값을 강제로 변경합니다 (root 권한이 필요합니다)

## How does it work

1. If you open a terminal or move a directory, check the composer.json file in that location.
2. Prints the name of the package specified in composer.json.
3. Check the minimum version of php specified in composer.json and change the setting temporarily or directly to match
   the php version installed in OS.
    - In the case of macOS, the PATH is temporarily added, so if you close the terminal, it will return to the original
      setting.
    - In the case of ubuntu, change the system settings forcibly (require root permission)
 