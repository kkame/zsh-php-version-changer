autoload -U add-zsh-hook
pvc() {

  if [ -f composer.json ]; then

    PVC_VERSION=$(cat composer.json | jq '.require.php' | grep -o -m 1 '[0-9]\.[0-9]' | head -1)

    if [ "$PVC_VERSION" ]; then

      case "$(uname -a)" in

      *Darwin*)

        if [[ -f "/usr/local/opt/php@$PVC_VERSION/bin/php" ]]; then
          export PVC_ORIGIN_PATH=$PATH
          cat composer.json | jq '"[" + .name + "] " + .type'
          echo "PHP" $PVC_VERSION "로 임시 전환합니다"
          export PATH="/usr/local/opt/php@$PVC_VERSION/bin:$PATH"
          export PATH="/usr/local/opt/php@$PVC_VERSION/sbin:$PATH"
        else
          echo "PHP $PVC_VERSION 이 설치되어있지 않습니다"
          echo "아래의 명령어로 php $PVC_VERSION 을 설치해주세요"
          echo "brew install php@$PVC_VERSION"
        fi
        ;;

      *Ubuntu*)
        if [ -f /usr/bin/php$PVC_VERSION ]; then

          PVC_ORIGIN_PHP_VERSION=$(php -v | grep -o -m 1 '[0-9]\.[0-9]' | head -1)

          cat composer.json | jq '"[" + .name + "] " + .type'
          echo "PHP" $PVC_VERSION "로 강제 전환합니다"
          sudo update-alternatives --set php /usr/bin/php$PVC_VERSION
        else
          echo "PHP $PVC_VERSION 이 설치되어있지 않습니다"
          echo "아래의 명령어로 php $PVC_VERSION 을 설치해주세요"
          echo "sudo apt install php$PVC_VERSION"
        fi
        ;;

      *)
        echo '지원하지 않는 OS입니다'
        ;;
      esac
    else
      echo "composer.json에서 PHP 버전을 찾을 수 없습니다"
    fi
  else

    if [ "$PVC_ORIGIN_PATH" ]; then
      echo "기존 PHP 버전으로 전환합니다"
      export PATH=$PVC_ORIGIN_PATH
      unset PVC_ORIGIN_PATH
    fi

    if [ "$PVC_ORIGIN_PHP_VERSION" ]; then
      echo "기존 PHP 버전으로 전환합니다"
      sudo update-alternatives --set php /usr/bin/php$PVC_ORIGIN_PHP_VERSION
      unset PVC_ORIGIN_PHP_VERSION
    fi

  fi
}
add-zsh-hook chpwd pvc
pvc
