#  【SwiftUI】フォントの指定方法（font）
https://capibara1969.com/1981/#toc2

文字のサイズ指定
 
.font(定義済フォントサイズ)
 
使用例で示す定義済フォントサイズを引数で指定します。
これらはiOSが提供する組み込みフォントサイズであり、実際にどのフォントが使用されるかは、機種や設定に依存します。
ユーザーのフォントに対する設定に応じて自動的に拡大または縮小されます

使用例
 
struct ContentView: View {
    var body: some View {
        VStack {
            Group {
                Text("default")
                Text("largeTitle").font(.largeTitle)
                Text("title").font(.title)
                Text("title2 *").font(.title2)
                Text("title3 *").font(.title3)
                Text("headline").font(.headline)
                Text("subheadline").font(.subheadline)
                Text("body").font(.body)
            }
            Text("callout").font(.callout)
            Text("caption").font(.caption)
            Text("caption2 *").font(.caption2)
            Text("footnote").font(.footnote)
            Divider()
            Text("*付きのフォントはiOS14から使用可能です").font(.footnote)
        }
    }
}

サイズを数値で指定する
.font(.system(size: サイズ, weight: フォントの太さ, design: フォントタイプ))
 
引数(size)でフォントのサイズを数値で指定します。
この場合、フォントのサイズは機種や設定に依存せず、指定したサイズに固定となります。

使用例
 
struct ContentView: View {
    var body: some View {
        Text("SwiftUI")
            .font(.system(size: 100, weight: .black, design: .default))
    }
}
 
