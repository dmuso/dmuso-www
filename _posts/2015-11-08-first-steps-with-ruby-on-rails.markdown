---
layout: post
title:  "First Steps with Ruby on Rails"
date:   2015-11-08 21:03:00
categories: ['ruby', 'rails']
---
You may be an absolute beginner in regards to Ruby on Rails, however, you've heard enough good things about it that you've decided to jump in. The question is, where do you start?

Some options would be [Ruby Warrior][1], [Code Academy][2], possibly hunt around for some tutorials, or decide on a web app to build and have a go. There is also another question that you're probably wanting to know that answer to, should I learn Rails or Ruby first?

## Rails or Ruby First?

The Ruby/Rails community is generally split at around 50/50 when it comes to the answer to this question. There is value in both options. If you start with Ruby first, you will understand many of the core language concepts. A Ruby first approach should also help you write cleaner code, which will help with long term maintenance of the first applications you write.

Now, Rails does have a lot of "magic" that you'll need to wrap your head around. There are many Rails concepts that are not a part of the core Ruby language. For example:

{% highlight ruby %}
3.days.ago
=> Thu, 05 Nov 2015 12:06:49 UTC +00:00
{% endhighlight %}

Attempting to use this outside of Rails will give you an error:

{% highlight ruby %}
3.days.ago
=> NoMethodError: undefined method `days' for 3:Fixnum
{% endhighlight %}

This is because Rails monkey-patches core Ruby libraries to make life easier for the Rails developer. This type of example is only scratching the surface of the magic that Rails gives to developers. Learning Rails first will give you access to this magic that will make your code simpler and more readable.

My recommendation is to use the book [Agile Web Development with Rails][3]. It teaches you how to build an ecommerce website, and takes you through it step by step. I learnt Rails first via this book, and I've seen two non-programmers use the book to learn Rails successfully.

[1]: https://www.bloc.io/ruby-warrior#/
[2]: https://www.codecademy.com/
[3]: https://pragprog.com/book/rails4/agile-web-development-with-rails-4
