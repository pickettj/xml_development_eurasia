# Beautiful Soup Notes



## The Basics

- [Made for html, but works fine for xml](http://www2.hawaii.edu/~takebaya/cent110/xml_parse/xml_parse.html): "The BeautifulSoup class was actually created to parse HTML files. However, the way that it parses HTML files involves coming up with a complex tree consisting of Python objects. This type of tree structure is applicable to XML files as well. Therefore, the BeautifulSoup class can also be used to parse XML files directly."

  - For HTML there are additional ways to navigate the data structure, anticipating HTML tags (e.g. `)

- Library uses its own `BeautifulSoup` data object, "which represents the document as a nested data structure."

  - Create the data object: `soup = BeautifulSoup(html_doc, 'html.parser')`
    - For basic xml, leave out `'html.parser'`; but you can [specify xml](http://www2.hawaii.edu/~takebaya/cent110/xml_parse/xml_parse.html): `soup = BeautifulSoup(contents,'xml')`

- Viewing the data:

  - Nice nested XML view: `print(soup.prettify())`

  - View raw text string: `str(tree)`

  - Another way of viewing just the raw text:

    - ```python
      for title in titles:
          print(title.get_text())
      ```

- [Kinds of objects](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#quick-start): "Beautiful Soup transforms a complex HTML document into a complex tree of Python objects. But you’ll only ever have to deal with about four kinds of objects: `Tag`, `NavigableString`, `BeautifulSoup`, and `Comment`."

  - "The `BeautifulSoup` object is the object that holds the entire contents of the XML file in a tree-like form. The `tag` object stores a HTML or XML tag. The `tag` object has a number of attributes and methods that make manipulating the XML file relatively easy." ([Link](http://www2.hawaii.edu/~takebaya/cent110/xml_parse/xml_parse.html).)
  - Extract the name of a tag object as a string: `name.tag`
  - "A tag may have any number of attributes. The tag `<b id="boldest">` has an attribute “id” whose value is “boldest”. You can access a tag’s attributes by treating the tag like a dictionary: `tag['id']`"
    - "You can access that dictionary directly as `.attrs`"
  - You modify a tag's attributes the same way you would a dictionary.

- [Navigation](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#quick-start): "The simplest way to navigate the parse tree is to say the name of the tag you want. If you want the <head> tag, just say `soup.head`"

  - This, however, just returns the tag as a *tag object*. `.contents` returns the contents (as a list).
  - "A tag’s children are available in a list called `.contents`"
    - "Instead of getting them as a list, you can iterate over a tag’s children using the `.children` generator"
    - "The `.descendants` attribute lets you iterate over all of a tag’s children, recursively: its direct children, the children of its direct children, and so on."
  - Iterate over the tags to return just a list of the raw strings:
    - `for string in soup.stripped_strings:
          print(repr(string))`
  - There are plenty of methods approximating xpath for navigating:
    - `.parent`
    - `.descendants`
    - `next_sibling` and `.previous_sibling`

- [Filters](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#quick-start):
  - The main methods are `find()` and `find_all()`, which do accept regex.
    - "If you pass in a list, Beautiful Soup will allow a string match against any item in that list."
      - E.g. `soup.find_all(["a", "b"])`
    - `find_all` returns type `bs4.element.ResultSet`
    - Recursive argument: "If you only want Beautiful Soup to consider direct children, you can pass in `recursive=False`."

