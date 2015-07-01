ruby Cookbook
=============
This cookbook install ruby.

Requirements
------------
#### pratform
- CentOS

Attributes
----------
#### ruby::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ruby']['version']</tt></td>
    <td>String</td>
    <td>install version</td>
    <td><tt>2.2.1</tt></td>
  </tr>
  <tr>
    <td><tt>['ruby']['install_dir']</tt></td>
    <td>String</td>
    <td>installation directory</td>
    <td><tt>/usr/local/src</tt></td>
  </tr>
  <tr>
    <td><tt>['ruby']['src']</tt></td>
    <td>String</td>
    <td>Source URL</td>
    <td><tt>http://cache.ruby-lang.org/pub/ruby/ruby-#{node['ruby']['version']}.tar.gz</tt></td>
  </tr>
</table>

Usage
-----
#### ruby::default
Just include `ruby` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ruby]"
  ]
}
```

License and Authors
-------------------
Authors: irotoris
