package video2

import (
	"context"
	"log"
	"net/http"

	"github.com/evt/video2/config"
	"github.com/evt/video2/db"
	"github.com/evt/video2/db/migrations"
	"github.com/evt/video2/server"
)

var s *server.Server

func init() {
	ctx := context.Background()

	// config
	cfg := config.Get()

	pgDB, err := db.Dial(cfg)
	if err != nil {
		log.Fatal(err)
	}

	// Run Postgres migrations
	if err := migrations.Run(pgDB); err != nil {
		log.Fatal(err)
	}

	// create new server instance
	s = server.Init(ctx, cfg, pgDB)
}

// ScheduleCall
func ScheduleCall(w http.ResponseWriter, r *http.Request) {
	s.ScheduleCall(w, r)
}

