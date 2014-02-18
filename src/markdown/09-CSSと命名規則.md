# Chapter 9: CSSと命名規則

## CSSの書き方




## iタグの是非とベストプラクティス

[FontAwesome](http://fontawesome.io/)や[Foundation](http://foundation.zurb.com/)では、HTMLのi要素をアイコン表示に流用しています。本来は、斜体を表示するためのHTMLタグなのですが、

- Icon(アイコン)の頭文字であること
- spanタグよりも表記が短い
- 可読性が高い

を理由にアイコン用のタグとして使っています。ただ、これには賛否があるようで、Bootstrapではこの方式は採用されず、spanタグが使われています。HTMLを比較してみましょう。

	<!-- Bootstrapの場合 -->
	<span class="glyphicon glyphicon-star"></span>

	<!-- FontAwesomeの場合 -->
	<i class="fa fa-star"></i>

	<!-- Foundation Icon Fontsの場合 -->
	<i class="fi-star"></i>

FontAwesomeの方が可読性が高いのは確かですが、標準への準拠という意味ではBootstrap方式が無難かもしれません。FontAwesomeを援護するとするならば、HTML5では「技術用語や外国語単語など、文中の他の語と別段の強調なしに区別するもの」とされているので、アイコンもそれにあたると主張することはできそうです。

	The i element represents a span of text offset from its surrounding content without conveying any extra emphasis or importance, and for which the conventional typographic presentation is italic text; for example, a taxonomic designation, a technical term, an idiomatic phrase from another language, a thought, or a ship name.

- HTML5仕様(ドラフト) [http://dev.w3.org/html5/markup/i.html](http://dev.w3.org/html5/markup/i.html)

賛否はあるものの、考えられる書き方としては次のようになるでしょう。

- A: `<span class="myicon myicon-star"></span>`
- B: `<span class="myicon">star</span>`
- C: `<i class="myicon myicon-star"></i>`
- D: `<i class="myicon">star</i>`
- E: `<i class="myicon-star"></i>`
- F: `<i>star</i>`

Bootstrap方式がA、FontAwesome方式がC、Foundation方式がEです。B, D, Fはリガチャを使った方式で、「star」は英単語として記述されるため、セマンティックWebの観点では望ましい形です。なお、もしiタグをサイト内でアイコン目的にのみ、使うことを徹底できるならばFの書き方も可能ですが、次の理由からお勧めはできません。

- シンボルフォントを複数読み込むことが難しい
- ウィジェットなどをページに読み込んだ際、別目的のiタグが混入する恐れがある

以上をまとめると、

- iタグを使うことは間違いではないが、spanタグを推奨 → A
- リガチャを使えるならば → B

を本書でのお勧めとしたいと思います。なお、FontAwesomeも、spanタグを使用したAの書き方が可能です。

	<!-- FontAwesomeでspanタグを使う例 -->
	<span class="fa fa-star"></span>


## シンボルフォントを混在させるベストプラクティス

例として、FontAwesomeをベースに、部分的にオリジナルのグリフを使うことを考えます。次の2つの方針のどちらかを選ぶことになるでしょう。

- A. グリフを追加した、派生フォントを作成する
- B. 独立したフォントを作成し、FontAwesomeと合わせて読み込む

Aの方法の方がシンプルなように一見思えますが、Open Font License適用や、FontAwesomeの構成の深い理解が必要となります。ここでは、Bの方針を選んで説明したいと思います。


### 独立したフォントを作成する

前章のように、追加したいグリフだけを含んだ、独自のシンボルフォント「MyIcons」を作成します。グリッドをFontAwesomeの14分割に合わせ、曲線のテイストもFontAwesomeに近づけると良いでしょう。


### CSSの作成

FontAwesomeの書き方に合わせて、CSSを用意します。@font-faceを定義して、読み込むフォントファイルのパスを設定します。

	@font-face {
	  font-family: 'MyIcons';
	  src: url('../fonts/myicons.eot');
	  src: url('../fonts/myicons.eot#iefix') format('embedded-opentype'), url('../fonts/myicons.woff') format('woff'), url('../fonts/myicons.ttf') format('truetype'), url('../fonts/myicons.svg#myicons') format('svg');
	  font-weight: normal;
	  font-style: normal;
	}

接頭辞をここでは"My Icon"の頭文字をとって「mi」としています。font-familyに@font-faceで設定したフォント名を指定します。

	.mi {
	  display: inline-block;
	  font-family: MyIcons;
	  font-style: normal;
	  font-weight: normal;
	  line-height: 1;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	}

クラス名はFontAwesomeに合わせて「〈接頭辞〉- 〈グリフ名〉」の形にします。

	.mi-coffee:before {
	  content: "\f0xx";
	}
	.mi-cup:before {
	  content: "\f0xx";
	}
	.mi-logo:before {
	  content: "\f0xx";
	}

上記内容を含むCSSを、myicons.css の名称で保存します。次のようなフォルダ構成を想定しています。

- font/
	- fontawesome-webfont.eot
	- fontawesome-webfont.svg
	- fontawesome-webfont.ttf
	- fontawesome-webfont.woff
	- myicons.eot
	- myicons.svg
	- myicons.ttf
	- myicons.woff
- css/
	- font-awesome.css
	- myicons.css
- index.html


HTMLに組み込む際は、ヘッダで両方のCSSを読み込んだ上で、使うフォントによってクラス名を切り替えればOKです。

- FontAwesome: `<i class="fa fa-star"></i>`
- 独自フォント: `<i class="mi mi-cup"></i>`


### 3つ以上のシンボルフォントの混在

例えば、FontAwesomeと、GLYPHICONSのそれぞれから、必要なグリフをピックアップして、さらに独自のフォントを合わせて使うという欲求に駆られるかもしれませんが、やめましょう。

- ベースグリッドサイズが違う
- デザインテイストが違う
- 標準の組み込み方法が違う
- ライセンスが違う

ベースになる何か1つと、独自のグリフだけであれば、ベースのフォントの作法に従うだけですが、3つ以上となると、これらの整合性を取るのがあまりに面倒です。[IcoMoon](http://icomoon.io/)など、複数のフォントのチャンポンを作る機能を提供していますが、使い方によってはOFLライセンスに違反する可能性があります。


## グリフ名の命名規則

ここまで、グリフ名について特に説明をして来ませんでしたが、現実的には日本語を使うことができません。結論から書くと、英数字のみに限定するべきです。それぞれの制約を見ていきましょぅ。

### CSSによる制約

CSS2.1の仕様を確認すると、"Syntax and basic data types"に下記のようにあります。

	In CSS, identifiers (including element names, classes, and IDs in selectors) can contain only the characters [a-zA-Z0-9] and ISO 10646 characters U+00A0 and higher, plus the hyphen (-) and the underscore (_); they cannot start with a digit, two hyphens, or a hyphen followed by a digit.

- Syntax and basic data types [http://www.w3.org/TR/CSS2/syndata.html](http://www.w3.org/TR/CSS2/syndata.html)

つまり、クラス名やID名に使えるのは、半角英数字とハイフンとアンダーバーのみです。また、CSSは大文字小文字を区別しないので、すべて小文字とした方が間違いがないでしょう。これをふまえて、いくつか例示してみます。

- ○ threeboys
- ○ three-boys
- ○ three_boys
- × three boys ※空白が入ると二つのクラス名として認識
- × 3boys ※数字で始まるのはNG
- × -3degree ※ハイフン+数字で始まるのはNG


### リガチャにする場合の制約

「-」(ハイフン)が入ると、リガチャとしてブラウザが認識しません。また、ブラウザによって「_」(アンダーバー)も認識しないケースがあるため、基本的には、英数字の組み合わせと考えた方が無難です。これをふまえてグリフ名の例示をすると、次のようになります。

- ○ smartphone
- × smart-phone ※ハイフンは使えない
- × smart_phone ※アンダーバーは使えない

ハイフンやアンダーバーが使えないとなると、問題になるのがプリフィックスです。miというプリフィックスをつけることを考えてみます。

- ○ `<span class="myicon">star</span>`
- × `<span class="myicon">mi-star</span>`
- × `<span class="myicon">mi_star</span>`
- × `<span class="myicon">mistar</span>`

プリフィックスのないパターンはもちろん問題ありません。しかし、上記の例ではプリフィックスを付けた後ろ3つはすべて不適当です。2つ目、3つ目は、前述の通り技術的な制約です。最後はなぜでしょうか? リガチャの利点のひとつはセマンティックなコーディングができることでした。しかし、「mistar」としてしまっては、無意味な文字列になってしまいます。

まとめると、リガチャを利用する場合、プリフィックスをつけてはいけません。有意味な単語であることを心がけましょう。

