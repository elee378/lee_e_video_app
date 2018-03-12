let webpack = require("webpack");
const UglifyJsPlugin = require('uglifyjs-webpack-plugin')
module.exports = {
	entry: "./scripts/app.js",
	output: {
        path:__dirname+"/public/assets/js",
        filename: "vp.js",
    },
    devServer:{
        inline:true,
        contentBase:"./lib",
        port:3000
   },
	module: {
		rules: [
			{
				test: /\.js$/,
                loader: "babel-loader",
                exclude: /node_modules/
			
            }
        ]
    },
    plugins: [
        new UglifyJsPlugin()
      ]
}
