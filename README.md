[![Build Status](https://drone.io/github.com/mplacona/giphy/status.png)](https://drone.io/github.com/mplacona/giphy/latest)

# Giphy API Dart Wrapper
---

This is a wrapper to the Giphy API for Dart. It let's you use Giphy's API in your projects to load up amazong gifs. Who doesn;t like cat's gifs then?

## Access and API Keys

The Giphy API is open to the public. They have instituted a simple, single public beta key system to let anyone try it out. The API key is required for all endpoints. <b>The public beta key is "dc6zaTOxFJmzC"</b>.  Please use this key while you develop your application and experiment with your integrations.

Once you are ready to use the Giphy API in production, please contact [api@giphy.com](mailto:api@giphy.com) to request a unique API key. In your email please provide the following information:

- The app name with brief description, web / app store links, etc.

- What is the 'live date' of the app or feature that integrates with the API?

- As per Giphy's section 5 A of their [terms](http://giphy.com/terms), they require all apps that use the Giphy API to conspicuously display "Powered By Giphy" attribution marks. You can find approved [official logo marks here](http://giphymedia.s3.amazonaws.com/giphy-api-icons.zip). Please be sure to include a screen shot of your app that includes the attribution.

<b>Note: the public key is subject to rate limit constraints. Giphy do not encourage live production deployments to use the public key.</b>

## Overview

The following JSON endpoints are currently supported:

+ search [Giphy's document](https://github.com/giphy/GiphyAPI#search-endpoint)
+ translate [Giphy's document](https://github.com/giphy/GiphyAPI#translate-endpoint)
+ random [Giphy's document](https://github.com/giphy/GiphyAPI#random-endpoint)
+ trending [https://github.com/giphy/GiphyAPI#trending-gifs-endpoint)
