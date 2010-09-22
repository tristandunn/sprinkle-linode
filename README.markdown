# sprinkle-linode

An abstraction of the [Sprinkle](http://github.com/crafterm/sprinkle) scripts I use to set up a [Rails](http://rubyonrails.org) environment on a Debian [Linode](http://linode.com), although it should work on any Debian 5.0 install.

## What does it install?

* Apache
* git
* monit
* MySQL
* Passenger
* Ruby
* Gems
  * mysql
  * rails

It can also copy over any virtual hosts you create in `assets/apache/sites` as well as run any setup SQL by placing your statements in `assests/database/setup.sql`.

## Quick Start

1. Install sprinkle, if you do not already have it.
   <pre><code>gem install sprinkle</code></pre>

3. Now download or clone [sprinkle-linode](http://github.com/tristandunn/sprinkle-linode).
   <pre><code>git clone git://github.com/tristandunn/sprinkle-linode.git</code></pre>

4. Edit, rename, or remove the the configuration files in <code>./assets/</code>.

5. Copy `deploy.example.rb` to `deploy.rb` and edit the settings appropriately. For more details on possible options, see [Capistrano](http://www.capify.org/).
   <pre><code>cp deploy.example.rb deploy.rb</code></pre>

6. Finally run `install.rb` with `sprinkle`.
   <pre><code>sprinkle -c -s install.rb</code></pre>

7. Now grab a drink, sit back, and relax. It will install everything in around 15 minutes!

## Credits

The majority of this is based on the examples provided with Sprinkle.

## License

The MIT License

Copyright (c) 2008-2009 Marcus Crafter crafterm@redartisan.com
Copyright (c) 2009-2010 Tristan Dunn

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
