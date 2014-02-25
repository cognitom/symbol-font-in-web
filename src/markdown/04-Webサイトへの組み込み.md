# Chapter 4: Webサイトへの組み込み


## HTML



## CSS



## リガチャの場合

他に先駆けてリガチャ対応のシンボルフォントを提供している、Symbolsetのブログ記事に倣うと、シンボルフォントを表示するには、次の4つの方法があります。

- Unicode `<i class="myicon">&#x2665;</i>`
- CSS classes `<i class="myicon mi-star"></i>`
- Keywords `<i class="myicon">star</i>`
- Keywords w/JS `<i class="myicon">star</i>`

ここで、UnicodeというのはHTMLに実体参照の形でコードを指定することですが、あまり使いやすいとは言えません。前節で説明したのが、まさにCSS classesのやりかたです。注目して欲しいのが、次のKeywordsの方法になります。class指定はされているものの"star"の文字が属性ではなくテキストとして書かれているのに気づいたでしょうか? HTMLでstarと4文字であっても、心配はありません。フォントにリガチャ(合字)の設定があれば、この部分は一文字のアイコンとしてブラウザ上に表示されるのです。

TODO: ここにスクリーンショット

- Browser support [http://blog.symbolset.com/browser-support](http://blog.symbolset.com/browser-support)


### 既存のフォントを使う

Chapter 1で紹介した、[Ligature Symbols](http://kudakurage.com/ligature_symbols/)を例に、HTMLへの組み込み方法を見ていきましょう。

TODO: つづき


### リガチャを旧いブラウザに対応させる


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


## クロスドメインの制約

例えば、フォントファイルをCDN (Content delivery network) に置きたい場合や、サブドメイン間でフォントを共有したい場合など、別ドメインからフォントを読み込むというケースがあります。

しかし、単にフォントファイルを別ドメインに置いただけだと、Firefoxほかいくつかの環境で読み込めなくなります。これらのブラウザでは、クロスドメインのアクセス明示的に許可しないと、フォントを使うことができないのです。こういった制約は、サーバの返すヘッダ情報に

	Access-Control-Allow-Origin "librize.com"

のように"Access Control Allow Origin"を設定することで解除することができます。フォントの配布が目的の場合など、不特定のサーバからアクセスできるようにしたければ、

	Access-Control-Allow-Origin "*"

のようにします。


### Nginxの設定例

	location ~* \.(ttf|svg|eot|woff)$ {
	    add_header Access-Control-Allow-Origin *;
	}


### Apacheの設定例

	<IfModule mod_headers.c>
	  <FilesMatch "\.(ttf|svg|eot|woff)$">
	    Header set Access-Control-Allow-Origin "*"
	  </FilesMatch>
	</IfModule>


## トラブルシューティング


### ローカルで制作するとき


### CDNを使う場合の注意点

