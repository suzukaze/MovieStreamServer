# MovieStreamServer

## インストール方法

Macでのインストール方法を説明します。

1. Xcode Command Line Toolsをインストールします。

  ```
  $ xcode-select --install
  ```
  
2. HomeBrewをインストールします。
   以下をmacOSのターミナルに貼り付けてください。
 
  ```
  $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/  HEAD/install.sh)
  ```

3. Rubyをインストールします。

  ```
  $ brew install rbenv ruby-build
  $ rbenv install 3.2.8
  $ echo 'eval "$(rbenv init -)"' >>  ~/.zshrc
  $ source ~/.zshrc
  $ rbenv global 3.2.8
  $ ruby -v
  ruby 3.2.8 (2025-03-26 revision 13f495dc2c) [arm64-darwin24]
  ```
 
4. MySQLをインストールします。

  ```
  $ brew install mysql@8.0
  ```

5. MySQLをサービスとして起動します。

  ```
  $ brew services start mysql@8.0
  ``` 

  停止する場合は`start`の代わりに`stop`を使用します。
  
  ```
  $ brew services stop mysql@8.0
  ```

6. MySQLのルートパスワードを変更します。

  ```
  $ mysql_secure_installation
  ```

  Macのrootパスワードを入力し、新しいMySQLのrootパスワードを設定します。

7. Ruby on Railsをインストールします。

  ```
  gem install rails -v 8.0.1
  ``` 

8. MySQLクライアントをインストールします。

  ```
  $ brew install mysql-client
  ```

9. Railsアプリを作成します。

  ```
  $ rails new MovieStreamServer -d mysql
  ```

10. bundleの設定をします。

  ```
  $ bundle config set path 'vendor/bundle'
  $ bundle config set --local build.mysql2 "--with-mysql-config=$(brew --prefix mysql-client)/bin/mysql_config --with-mysql-dir=$(brew --prefix mysql-client) --with-mysql-include=$(brew --prefix mysql-client)/include --with-mysql-lib=$(brew --prefix mysql-client)/lib --with-ldflags=-L$(brew --prefix openssl)/lib -L$(brew --prefix zstd)/lib --with-cppflags=-I$(brew --prefix openssl)/include -I$(brew --prefix zstd)/include"
  ```

11. bundlerをインストールします。

  ```
  $ gem install bundler -v 2.7.1
  ```

12. Gemをインストールします。

  ```
  $ bundle install
  ```

13. データベースのパスワードを設定します。

  プロジェクト直下の`.env_example`を`.env`としてコピーします。
  
  ```
  $ cp .env_example .env
  ```
  
  `.env`のパスワードを先ほど設定したMySQLのrootパスワードに書き換えます。

  ```
  DB_USERNAME='root'
  DB_PASSWORD='<パスワード>'
  ```
  
14. データベースを作成します。

  ```
  $ bundle exec rails db:create
  ```

15. データベースにジャンルと動画情報を入れます。

  ```
  $ bundle exec rails console
  $ Genre.create(name: "海")
  $ Movie.create(title: "波", genre_id: Genre.find_by(name: "海").id, url_string: "wave_in_sea.mp4", thumbnail_url_string: "wave_in_sea_thumbnail.jpg")
  $ Movie.create(title: "鳥", genre_id: Genre.find_by(name: "海").id, url_string: "bird_in_sea.mp4", thumbnail_url_string: "bird_in_sea_thumbnail.jpg")
  $ Movie.create(title: "船",  genre_id: Genre.find_by(name: "海").id, url_string: "ships_in_sea.mp4", thumbnail_url_string: "ships_in_sea_thumbnail.jpg")
  ```
  
  Ctrl+Zでrails consoleから抜けます。
 
16. サーバーを起動します。

  ```
  $ bundle exec rails server
  ```
  
  停止する場合は、Ctrl+Cです。
 
17. ブラウザからサーバーにアクセスします。

   ブラウザのアドレスに`http://localhost:3000/`と入力します。
