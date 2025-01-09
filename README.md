<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="" alt="Logo" width="80" height="80">
  </a>
  <p align="center">
    <br />
    <a href="#getting-started"><strong>Getting Started »</strong></a>
    <br />
    <br />
    <a href="#features">Features</a> ·
    <a href="#installation">Installation</a> ·
    <a href="#usage">Usage</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
<summary>Table of Contents</summary>
<ol>
  <li>
    <a href="#about">About</a>
  </li>
  <li>
    <a href="#getting-started">Getting Started</a>
    <ul>
      <li><a href="#prerequisites">Prerequisites</a></li>
      <li><a href="#installation">Installation</a></li>
    </ul>
  </li>
  <li>
    <a href="#usage">Usage</a>
    <ul>
      <li><a href="#current-lualingo-functionality">Current lualingo Functionality</a></li>
      <li><a href="#using-templates">Using Templates</a></li>
      <li><a href="#creating-a-complete-page">Creating a Complete Page</a></li>
      <li><a href="#creating-your-own-templates">Creating your own Templates</a></li>
      <li><a href="#currently-supported-html-elements">Currently Supported HTML Elements</a></li>
    </ul>
  </li>
  <li><a href="#todo">TODO</a></li>
  <li><a href="#examples">Examples</a>
    <ul>
      <li><a href="#creating-a-simple-blog-post">Creating a Simple Blog Post</a></li>
    </ul>
  </li>
  <li><a href="#cli-visualiser">CLI Visualiser</a></li>
</ol>
</details>


## Motive

I wanted an introduction to Lua and so lualingo was just my idea of exploring lua by building a simple HTML templating engine. 
Not intending it for any practical use but to serve as lua101 through an exercise in HTML templating engine/code generation and so forth + a lua playground.


## About Project

Tbc...

### Features

- Generate common HTML elements (headings, paragraphs, lists, links, images)

- Terminal preview of both page content and HTML markup

- Appropriate formatting of rendered HTML 


## Getting Started

### Prerequisites

* **Lua** (5.4 recommended)

#### Installation Instructions by OS

**macOS:**

```bash

# install Homebrew if not already installed

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install Lua

brew install lua

```

**Linux:**

```bash

# installation using apt (Debian/Ubuntu)

sudo apt install lua5.4

# installation using yum

sudo yum install lua5.4

```

**Windows:**

```md

1. Download Lua from the official website: https://www.lua.org/download.html

2. Follow the installation wizard

3. Add Lua to your system's PATH

```

### Installation

1. Clone the repository:

```bash

git clone https://github.com/zakmoCA/lua-templates.git

```

2. Navigate to the project directory:

```bash

cd lua-templates

```

## Structure

### Current lualingo Functionality 

```lua

local html = require("templater")

-- 💬 elements created with the html modules corresponding element-method ie. html.elementName(content)

-- create <head> elements (can append other head elements here ie. <meta> || <link> || <style> etc.)

local headContent = html.head("This is head content", "Page Title")

-- create h1 and p elements to demonstrate

local heading = html.h1("Welcome to My Page")

local paragraph = html.p("This is a sample paragraph.")

```

### Templates

```lua

-- define a template with variables

local template = [[

{{header}}

{{content}}

{{footer}}

]]

-- populate the template

local content = html.template(template, {

    header = html.h1("Welcome"),

    content = html.p("Main content here"),

    footer = html.p("Footer text")

})

```

### Page Creation

```lua

-- combine everything into a page

local bodyContent = html.template([[

    {{heading}}

    {{intro}}

]], {

    heading = html.h1("Welcome to Our Site"),

    intro = html.p("This is an introduction paragraph."),

})

local page = html.page(headContent, bodyContent)

-- write to file

html.write("index.html", page)

```

### TODO

Project scope is limited to the basic core html elements, the list below involves enough variety as a parsing/formatting/tenmplating exercise to suffice for the project objectives.

- [ ] Remaining elements
- [ ] Package program
- [ ] Write docs for how to use

#### Remaining elements 

- [ ] \<img\>
- [ ] \<a\>
- [ ] \<link\>
- [ ] \<div\>
- [ ] \<ul\>
- [ ] \<ol\>
- [ ] \<li\>
- [ ] \<span\>
- [ ] \<br\>
