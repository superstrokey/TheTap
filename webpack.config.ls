require! {
  \html-webpack-plugin
  \html-webpack-inline-source-plugin
  \path 
  \uglifyjs-webpack-plugin 
  \webpack 
}

module.exports =
  mode: 'none'
  entry: \./src/index.ls
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
        use: \style-loader
  plugins:
    * new uglifyjs-webpack-plugin!
    * new html-webpack-plugin do
        title: '[ The Tap ]'
        cache: false
        minify: { +collapse-whitespace }
        hash: true
        inline-source: /.css$/
    * new html-webpack-inline-source-plugin!
  resolveLoader:
    modules: [ path.join __dirname, \node_modules ]
  resolve:
    modules: [ path.join __dirname, \node_modules ]
    extensions: <[ .ls .js ]>
