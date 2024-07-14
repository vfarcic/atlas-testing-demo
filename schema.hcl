schema "public" {
}

table "users" {
  schema = schema.public
  column "id" {
    type = int
  }
  column "name" {
    type = text
  }
//   primary_key {
//     columns = [
//       column.id
//     ]
//   }
}

// table "transactions" {
//   schema = schema.public
//   column "id" {
//     type = int
//   }
//   column "user_id" {
//     type = int
//   }
//   column "amount" {
//     type = decimal
//   }
//   column "is_income" {
//     type = boolean
//     as {
//       expr = "positive(amount)"
//     }
//   }

//   primary_key {
//     columns = [column.id]
//   }

//   foreign_key "user_fk" {
//     columns = [column.user_id]
//     ref_columns = [table.users.column.id]
//     on_delete = CASCADE
//     on_update = NO_ACTION
//   }
// }

// function "positive" {
//   schema = schema.public
//   lang   = SQL
//   arg "v" {
//     type = decimal
//   }
//   return = boolean
//   as     = "SELECT v > 0"
// }
