Thanks for contributing to the Turbo Invoice API project!

When you create a pull request, please include the following:

* Mention the issue it solves (eg. #54)
* Make sure you have automated tests for your work, where possible.

All pull requests should pass continuous integration and style checks before being merged. You can run tests locally as follows:

 - `rake spec` to run all Ruby tests
 - `rake spec:models` to run Ruby model tests
 - `rake spec:controllers` to run Ruby controller tests
 - `rubocop` to run the code analyzer/formatter
 - `rspec ./spec/path/to/my_spec.rb` to run all Ruby tests in the file `my_spec.rb`

If you would like to discuss an idea before submitting a pull request,
please open a [GitHub Issue](https://github.com/brandonbaker40/turbo_invoice_backend/issues).
