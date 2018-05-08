require! {
  \css-loader
  \html-webpack-plugin
  \html-webpack-inline-source-plugin
  \path
  \webpack 
}

module.exports =
  mode: 'none'
  entry: \./src/entry
  output:
    path: path.join __dirname, \.
    filename: \index.min.js
  module:
    rules:
      * test: /\.ls$/
        exclude: /node_modules/
        use: <[ babel-loader livescript-loader ]>
      * test: /\.css$/
        exclude: /node_modules/
        use: <[ style-loader css-loader ]>
  plugins:
    * new html-webpack-plugin do
        title: '[ The Tap ]'
        cache: false
        minify: { +collapse-whitespace }
       # minify: false
        hash: true
        inline-source: /.css$/
    * new html-webpack-inline-source-plugin!
  resolveLoader:
    modules: [ path.join __dirname, \node_modules ]
  resolve:
    modules: [ path.join __dirname, \node_modules ]
    extensions: <[ .ls .js ]>
