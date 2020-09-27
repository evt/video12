package migrations

import (
	"fmt"

	"github.com/go-pg/migrations/v7"
)

func init() {
	migrations.MustRegisterTx(func(db migrations.DB) error {
		fmt.Println("creating table calls...")
		_, err := db.Exec(`CREATE TABLE calls(
				call_id serial not null primary key,
				room_number integer not null,
				call_status integer not null,
				created timestamp default current_timestamp
		)`)
		return err
	}, func(db migrations.DB) error {
		fmt.Println("dropping table calls...")
		_, err := db.Exec(`DROP TABLE calls`)
		return err
	})
}
