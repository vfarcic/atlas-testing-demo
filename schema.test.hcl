// test "schema" "positive_func" {
//   parallel = true
//   for_each = [
//     {input: 1, expected: "t"},
//     {input: 0, expected: "f"},
//     {input: -1, expected: "f"},
//   ]
//   exec {
//     sql = "SELECT positive(${each.value.input})"
//     output = each.value.expected
//   }
// }


test "schema" "users_table" {
  # Expected exec to pass.
  exec {
    sql = <<SQL
INSERT INTO users(id, name) VALUES (1, 'vfarcic');
INSERT INTO users(id, name) VALUES (2, 'sfarcic');
SQL
  }
  # Expected exec to pass and output
  # be equal to the expected table.
  exec {
    sql = "SELECT id, name FROM users;"
    format = table
    // FIXME: This will fail big time with bigger tables
    output = <<TAB
 id |  name
----+---------
 1  | vfarcic
 2  | sfarcic
TAB
  }
//   FIXME: `catch` is always executed and not only when a test fails?
//   catch {
//     sql   = "SELECT * FROM users"
//     error = "incomplete input"
//   }
  log {
    message = "Users are alive!"
  }
}

// test "schema" "users_table" {
//   exec {
//     sql = <<SQL
// INSERT INTO users(id, name) VALUES (1, 'vfarcic');
// INSERT INTO users(id, name) VALUES (2, 'sfarcic');
// SQL
//   }
//   FIXME: `The assert command expects an SQL statement to pass and the output to be a single row (+column) with a true value.`
//   FIXME: That sounds almost useless
//   assert {
//     sql = <<SQL
// SELECT id, name FROM users;
// SQL
//     error_message = "expects something else"
//   }
// }

test "schema" "seed" {
  for_each = [
    {input: "hello", expected: "HELLO"},
    {input: "world", expected: "WORLD"},
  ]
  log {
    message = "Testing ${each.value.input} -> ${each.value.expected}"
  }
  exec {
    sql    = "SELECT upper('${each.value.input}')"
    output = each.value.expected
  }
}
