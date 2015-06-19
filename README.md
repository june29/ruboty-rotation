# Ruboty::Rotation

Rotation management system for Ruboty.

## Usage

```
@ruboty rotation current             - Show current item
@ruboty rotation items               - Show all items
@ruboty rotation items add <item>    - Add item
@ruboty rotation items delete <item> - Delete item
@ruboty rotation next                - Move to next
@ruboty rotation prev                - Move to prev
```

## Example

```
> @ruboty rotation items add one
Item one added
> @ruboty rotation items add two
Item two added
> @ruboty rotation items add three
Item three added
> @ruboty rotation items
one,two,three
> @ruboty rotation current
one
> @ruboty rotation next
> @ruboty rotation current
two
> @ruboty rotation next
> @ruboty rotation current
three
> @ruboty rotation next
> @ruboty rotation current
one
```
