# PictureFrame

Draw predefined or custom frames around text.

## Installation

Add this line to your application's Gemfile:

    gem 'picture_frame'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install picture_frame

## Usage


    > PictureFrame.show_case("Hello, World!")
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
    ∥                ∥
    |  Hello, World!  |
    ∥                ∥
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

    > PictureFrame.show_case("Hello\nWorld")
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
    ∥        ∥
    |  Hello  |
    |  World  |
    ∥        ∥
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

