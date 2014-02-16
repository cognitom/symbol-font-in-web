# Chapter 2: Webフォントの台頭とブラウザ対応


## Webデザインで重要度を増すタイポグラフィ


## Webフォントの提供サービス
シンボルフォントという文脈からは少し逸脱するものの、Webにおけるタイポグラフィの盛り上がりは、関係の濃い分野なので、簡単に関連サービスを紹介します。



### Google Fonts
http://www.google.com/fonts/

### TypeKit
https://typekit.com/
Webフォントの最先発です。2011年にAdobeに買収され、現在はCreative Cloudからも利用可能なサービス。

### Fonts.com
http://www.fonts.com/
英語フォントがメインですが、日本語でもサービス提供しています。AXISフォントなど。

### FONTPLUS
http://webfont.fontplus.jp/
日本語のWebフォントサービスの老舗。

### TypeSquare
http://typesquare.com/
モリサワが提供する日本語のWebフォントサービス。月1万ページビューまでは、1ドメインあたり1フォントを無料で使えるプランも。


## Webフォントの各種形式と今後のスタンダード

### TTF (TrueType Font)
従来からデスクトップアプリケーションで利用されて来た形式です。Webフォントとして、ブラウザから直接読み込んで利用することも可能で、単純にTTF形式のフォントをサーバ上に置いて、CSSから読み込むことでローカルにインストールされたフォントと同様に利用が可能です。

サポートブラウザも多いのですが、残念ながらWebでの利用を前提に作られた形式ではないため、ライセンスの問題を含んでいます。例えば、Mac OS Xに搭載されているヒラギノフォントですが、提供元の千都フォント(大日本スクリーン製造)のサイトで「ライセンスについてのFAQ」を参照すると

> フォントとして機能する形態でデータを制作する場合は、使用許諾外となります。

と書かれており、WebフォントとしてTTF形式で配布することはライセンス違反となってしまいます。

- 千都フォント ライセンスについてのFAQ: http://www.screen.co.jp/ga_product/sento/support/licensefaq.html

どうしてもヒラギノを


### EOT (Embedded OpenType)
EOTはMicrosoftがInternet Explorer 4 で導入したフォント形式です。当初から、

- フォントのライセンス問題
- フォントサブセット

に対応し、

- Embedded OpenType: http://www.microsoft.com/typography/web/embedding/default.aspx

### SVG


### WOFF (Web Open Font Format)

Introducing WOFF (Web Open Font Format)
http://dev.opera.com/articles/view/introducing-woff-web-open-font-format/


http://www.w3.org/TR/2012/REC-WOFF-20121213/

### WOFF 2.0


### スタンダードと現実解


## 参考: 各種形式の変換

WOFF → OTF
https://github.com/hanikesn/woff2otf
