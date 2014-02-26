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

| ブラウザ           | TTF対応 |
| ----------------- | :-: |
| Chrome            | ver 4〜 |
| Safari            | ver 3.1〜 |
| Firefox           | ver 3.5〜 |
| Internet Explorer | ver 9〜 |

サポートブラウザも多いのですが、残念ながらWebでの利用を前提に作られた形式ではないため、ライセンスの問題を含んでいます。例えば、Mac OS Xに搭載されているヒラギノフォントですが、提供元の千都フォント(大日本スクリーン製造)のサイトで「ライセンスについてのFAQ」を参照すると

> フォントとして機能する形態でデータを制作する場合は、使用許諾外となります。

と書かれており、WebフォントとしてTTF形式で配布することはライセンス違反となってしまいます。

- 千都フォント ライセンスについてのFAQ: http://www.screen.co.jp/ga_product/sento/support/licensefaq.html

どうしてもヒラギノを使いたければ、現状では、FONTPLUSで有料のWebフォントを使う必要があるでしょう。

[IEBlogの2010年の記事](http://blogs.msdn.com/b/ie/archive/2010/07/15/the-css-corner-better-web-typography-for-better-design.aspx)でも指摘されているように、フリーフォントについては問題ないものの、品質の高い商用フォントの大多数はライセンス上使えません。また、IE9で使えるTTFはインストール可能なものという限定があります。

> Raw fonts work well if your fonts' end-user license (EULA) allowed you to serve them from your web server. While this is true for many free fonts, this is not the case for the vast majority of commercial fonts.

- [http://blogs.msdn.com/b/ie/archive/2010/07/15/the-css-corner-better-web-typography-for-better-design.aspx](http://blogs.msdn.com/b/ie/archive/2010/07/15/the-css-corner-better-web-typography-for-better-design.aspx)


### EOT (Embedded OpenType)

EOTはMicrosoftが導入したフォント形式です。最初の技術デモはにInternet Explorer 4を対象としていたので、1997年まで遡ります。当初から、

- フォントのライセンス問題
- フォントサブセット

に対応していましたが、ブラウザが限定されていたこともあり、普及は限定的でした。Internet Explorer 5.5までは細かい問題をあったものの、6以降は安定して使えるようになっています。

| ブラウザ           | EOT対応 |
| ----------------- | :-: |
| Chrome            | × |
| Safari            | × |
| Firefox           | × |
| Internet Explorer | ver 4〜 |

- Embedded OpenType: [http://www.microsoft.com/typography/web/embedding/default.aspx](http://www.microsoft.com/typography/web/embedding/default.aspx)


### SVG フォント

SVG(Scalable Vector Graphics)は、2000年前後に登場した汎用のベクター画像形式です。IllustratorやFlashと異なり、XMLを基本としたオープンな形式をとります。そのため、Webにおけるベクター表示の標準として期待されましたが、普及が進んだのは比較的最近です。Internet Explorerに至っては、バージョン8でようやく対応した状態です(ただし、画像表示などの基本部分のみ)。

実は、SVGは画像形式でありながら、フォント形式も仕様に含まれています。当時(今も)、OSのフォント環境に依存すると、ドキュメントが意図した通りに表示できない可能性がありました。SVGではその点を重視して、バージョン1.0から各文字をSVGで表現してフォントにすることが提案されていました。しかし、Webブラウザのフォントとしてはなかなか採用されず、最近やっとChromeとSafariで対応した段階です。

| ブラウザ           | SVG基本対応 | SVGフォント対応 |
| ----------------- | :-: | :-: |
| Chrome            | ver 4〜 | ver 31〜 |
| Safari            | ver 3.1〜 | ver 5.1〜 |
| Firefox           | ver 2〜 | × |
| Internet Explorer | ver 9〜 | × |

OpenTypeやWOFFは、歴史的な背景でキメラ化していますが、SVGはその点、構造が至ってシンプルです。またオープンなことも使いやすい点です。ただ、その分、ライセンスの問題もあり、過去のフォント資産がそのままSVGフォントとして使えることはまれです。

- 最初にフォントについて書かれたワーキングドラフト [http://www.w3.org/TR/1999/WD-SVG-19991203/](http://www.w3.org/TR/1999/WD-SVG-19991203/)
- 現在の最新版 SVG 1.1 (Second Edition) [http://www.w3.org/TR/SVG11/fonts.html](http://www.w3.org/TR/SVG11/fonts.html)


### WOFF (Web Open Font Format)


| ブラウザ           | WOFF対応 |
| ----------------- | :-: |
| Chrome            | ver 5〜 |
| Safari            | ver 5.1〜 |
| Firefox           | ver 3.6〜 |
| Internet Explorer | ver 9〜 |


Introducing WOFF (Web Open Font Format)
http://dev.opera.com/articles/view/introducing-woff-web-open-font-format/

[http://www.w3.org/TR/2012/REC-WOFF-20121213/](http://www.w3.org/TR/2012/REC-WOFF-20121213/)


### スタンダードと現実解

| ブラウザ           | WOFF対応 | SVGフォント対応 | EOT対応 | TTF対応 |
| ----------------- | :-: | :-: | :-: | :-: |
| Chrome            | ver 5〜 | ver 31〜 | × | ver 4〜 |
| Safari            | ver 5.1〜 | ver 5.1〜 | × | ver 3.1〜 |
| Firefox           | ver 3.6〜 | ver 5.1〜 | × | ver 3.5〜 |
| Internet Explorer | ver 9〜 | × | ver 4〜 | ver 9〜 |


## 参考: 各種形式の変換

WOFF → OTF
https://github.com/hanikesn/woff2otf
