# Xendit Ruby library

This is the Unofficial Ruby API client/library for Xendit API.

<!-- toc -->

- [API Documentation](#api-documentation)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
  * [Invoice Service](#invoice-service)

<!-- tocstop -->

## API Documentation

Please check [Xendit API Reference](https://xendit.github.io/apireference/).

## Requirements
- Ruby 2.5+

## Installation

### Using Gemfile
Install the gem and add to the application's Gemfile by executing:
```ruby
bundle add xendit-client
```
Or add gem xendit-client to Gemfile
```ruby
gem 'xendit-client'
```
Run this command in your terminal

```ruby
bundle install
```

## Usage

Get your API key from [Xendit Dashboard](https://dashboard.xendit.co/settings/developers#api-keys).

Add your API key to the initializer.

```ruby
require 'xendit'

Xendit.api_key = 'xnd_...'
```
