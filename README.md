# PictureFrame

[![Build Status](https://api.travis-ci.org/mschuerig/picture_frame.png?branch=master)](https://travis-ci.org/mschuerig/picture_frame) [![Gem Version](https://badge.fury.io/rb/picture_frame.png)](http://badge.fury.io/rb/picture_frame) [![Coverage Status](https://coveralls.io/repos/mschuerig/picture_frame/badge.png)](https://coveralls.io/r/mschuerig/picture_frame)

Draw predefined or custom frames around text.

## Installation

Add this line to your application's Gemfile:

    gem 'picture_frame'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install picture_frame

## Usage

    > f = PictureFrame.create
    > puts f.frame('Hello, World!')
    +---------------+
    | Hello, World! |
    +---------------+

    > f = PictureFrame.create(:stars)
    > puts f.frame('Hello, World!')
    *****************
    * Hello, World! *
    *****************

    puts PictureFrame.create(:random).frame('Surprise!')
    ⌜           ⌝
      Surprise!
    ⌞           ⌟

    > f = PictureFrame.create("-- * --", :placeholder => '*')
    > puts f.frame('Just a line')
    -- Just a line --

### Showcase

    > PictureFrame.showcase("Hello, World!")
    :default
    +---------------+
    | Hello, World! |
    +---------------+

    :stars
    *****************
    * Hello, World! *
    *****************

    :slashes
    ///////////////////
    // Hello, World! //
    ///////////////////

    :hashes
    #################
    # Hello, World! #
    #################

    :ornate
    %=---------------=%
    ∥                 ∥
    |  Hello, World!  |
    ∥                 ∥
    %=---------------=%

    :ephemeral
    ⌜               ⌝
      Hello, World!
    ⌞               ⌟

    :box
      +-----------------+
     /                 /|
    +-----------------+ |
    |                 | |
    |  Hello, World!  | |
    |                 | +
    |                 |/
    +-----------------+

    > PictureFrame.showcase("Hello\nWorld")
    :default
    +-------+
    | Hello |
    | World |
    +-------+

    :stars
    *********
    * Hello *
    * World *
    *********

    :slashes
    ///////////
    // Hello //
    // World //
    ///////////

    :hashes
    #########
    # Hello #
    # World #
    #########

    :ornate
    %=-------=%
    ∥         ∥
    |  Hello  |
    |  World  |
    ∥         ∥
    %=-------=%

    :ephemeral
    ⌜       ⌝
      Hello
      World
    ⌞       ⌟

    :box
      +---------+
     /         /|
    +---------+ |
    |         | |
    |  Hello  | |
    |  World  | |
    |         | +
    |         |/
    +---------+


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## TODO

* Ensure that multibyte characters work properly
* Support ANSI colors.
