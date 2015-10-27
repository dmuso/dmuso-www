---
layout: post
title:  "Double or Single Quoted Strings in Ruby"
date:   2015-10-27 21:14:00
categories: ['ruby']
---
Once you've been coding in Ruby for a while, you start to notice a trend. No one can decide whether to use double or single quoted strings in Ruby! You'll see code written in examples, tutorials, gems, and the code from your teammates that will have a mixture of single or double quotes for strings. Sometimes there will seem to be little rhyme nor reason as to why someone has used single or double quotes.

## String Interpolation

There is one reason that you've probably already noticed: you need to use double quotes when your string requires interpolation.

{% highlight ruby %}
colour = 'green'
=> "green"
"The colour of the light is #{colour}"
=> "The colour of the light is green"
{% endhighlight %}

So, that's the first rule of Ruby strings: Use double quotes when you need string interpolation.

## Escaping Special Characters

If you need to print special characters out to a console or file, you'll need to use a double quoted string.

{% highlight ruby %}
colour = 'green'
=> "green"
puts "The colour of the light is:\n#{colour}"
=> The colour of the light is:
=> green
{% endhighlight %}

Using single quoted strings in this example will literally print `\n` to your console:

{% highlight ruby %}
puts 'The colour of the light is:\ngreen'
=> The colour of the light is:\ngreen
{% endhighlight %}

## Performance

You may hear someone say that single quoted strings are faster than double quoted strings. Technically, this is true, however, the performance gains vary and have been recorded to be between 0.4% and 3% faster using single quotes. If every single microsecond is important to you, then use single quoted strings.

## RuboCop

When working with a team of people with varying levels of experience in Ruby, it can be helpful to have coding style guides and have them enforced at build/test time with something like [RuboCop](https://github.com/bbatsov/rubocop). If there is any slight chance that you want to add RuboCop at some point in the future. Save yourself the future headaches and conform to RuboCop's default rules on strings, which is:

**Use single quoted strings unless interpolation is required.**

When you have a large codebase, even if you're the only developer, it can be a lot of work to replace quotes in nearly all of your source code files. The best option would probably be to add RuboCop early on in a project so that the styling is consistent. It's not a fun job to go back and tweak all your source code to make them consistent.
