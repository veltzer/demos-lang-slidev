# Navigating a Long File

This code block is scrollable. Click to automatically scroll to different key sections of the code.

```html {5-17|18-30|31-43|44-}
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Long Document Example</title>
  <style>
    body { font-family: sans-serif; }
    .header { background-color: #f0f0f0; padding: 1rem; }
    .main { padding: 1rem; }
    .footer { background-color: #333; color: white; padding: 1rem; }
  </style>
</head>
<body>

<header class="header" id="section-header">
  <h1>Welcome to the Page</h1>
  <nav>
    <a href="#section-main">Main Content</a>
    <a href="#section-footer">Footer</a>
  </nav>
</header>

<main class="main" id="section-main">
  <h2>Main Content Area</h2>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Curabitur vitae semper sem, et feugiat nunc.
    Nullam et justo ut turpis finibus suscipit.
    </p>
  <p>
    This demonstrates how the content can be quite long,
    forcing the user to scroll to see everything.
  </p>
</main>

<footer class="footer" id="section-footer">
  <h2>Footer Section</h2>
  <p>
    Contact information and other details go here.
    This is the end of the document.
  </p>
  <p>&copy; 2025 My Website</p>
</footer>

</body>
</html>
```
