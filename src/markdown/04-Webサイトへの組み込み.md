# Chapter 4: Webサイトへの組み込み


## HTML



## CSS



## リガチャーの場合



### リガチャーを旧いブラウザに対応させる


## FOUTへの対処

FOUTは"Flash of Unstyled Text"の略で、当初から指摘されていたWebフォント特有の問題です。

http://www.paulirish.com/2009/fighting-the-font-face-fout/


"Quick guide to webfonts via @font-face"
http://www.html5rocks.com/en/tutorials/webfonts/quick/


## フォントをCSSに埋め込む

"data" URL スキーム(以下、data URL)を使って、フォントデータをCSSに直接埋め込んでしまうことも可能です。対応ブラウザが限られてしまうので、現時点での利用できるケースは限定的ですが、

- リクエストを減らす
- CSSにパス情報が不要
- クロスドメイン制約を受けない

などのメリットがあります。

data URLは[RFC2397](http://tools.ietf.org/html/rfc2397)で定義されている、CSSやHTMLの中に画像などのファイルを埋め込んでしまう技術です。

- RFC2397: http://tools.ietf.org/html/rfc2397


## トラブルシューティング


### ローカルで制作するとき


### CDNを使う場合の注意点

