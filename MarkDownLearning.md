# MarkDown Learning

## Text formatting
normal text
[not a new line]

**bold**

_italics_

~~strikethrough~~


## Links
4 ways to link (orderered list):

1. <http://aviralgarg.com>

1. [Text Link](http://aviralgarg.com "hover text") with hover text

1. [Link][1] by number (URL at the end of markdown file; not visible in preview)

1. [Link][avi] by token (URL at the end of markdown file; not visible in preview)


## Images

1. ![](https://unsplash.it/200/300/?image=1) (opens in new tab)

1. [![](https://unsplash.it/50/50/?image=1)](https://unsplash.it/200/300/?image=1)

1. [<img src="https://unsplash.it/50/50/?image=1" target="_blank">](https://unsplash.it/200/300/?image=1) (using html)

    * This is an image inside nested list

        ![](https://unsplash.it/50/50/?image=1) (opens in new tab)

## List + code blocks + horizontal rule
Unordered list:

 + Code
    * code block
    ```js
    var x = 10;
    ```
    * inline code `var x = 100;`
    * addition and deletion in code
    ```diff
    - var x = 10;
    + var y = 100;
    ```

Horizontal rule after line break

---

## Table
|Left-align|Centre-align|Right-align|
|:---------|:----------:|----------:|
|':--'above|decides the |alignment  |

## Quotations
> 'The saying'
> **- Dude who said it**

## Checkboxes
* [ ] not done
* [x] finished

## Github (not working-- added to issues)
* issues: #2
* pull-request: #1
* referencing people: @AviralGarg1993

[1]:http://aviralgarg.com
[avi]:http://aviralgarg.com