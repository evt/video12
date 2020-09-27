package main

import (
	"context"
	"fmt"
	"github.com/evt/video12/db/migrations"
	"github.com/evt/video12/scheduler"
	"log"
	"net/http"
	"time"

	"github.com/evt/video12/config"
	"github.com/evt/video12/db"
	"github.com/evt/video12/server"
)

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}
}

func run() error {
	ctx := context.Background()

	// config
	cfg := config.Get()

	// connect to Postgres
	pgDB, err := db.Dial(cfg)
	if err != nil {
		log.Fatal(err)
	}

	// Run Postgres migrations
	if err := migrations.Run(pgDB); err != nil {
		log.Fatal(err)
	}

	// create google cloud scheduler client
	sch, err := scheduler.Init(ctx)
	if err != nil {
		log.Fatal(err)
	}

	// create new server instance
	s := server.Init(ctx, cfg, pgDB, sch)

	// run http server
	addr := ":8080"

	httpServer := &http.Server{
		Addr:         addr,
		Handler:      s,
		ReadTimeout:  10 * time.Second,
		WriteTimeout: 10 * time.Second,
	}

	fmt.Printf("Running http server on %s\n", addr)

	if err := httpServer.ListenAndServe(); err != nil {
		return err
	}

	return nil
}
