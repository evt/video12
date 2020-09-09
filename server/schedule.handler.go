package server

import (
	"net/http"
)


// handleCallSchedule handles POST /schedule request
func (s *Server) handleCallSchedule() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		s.ScheduleCall(w, r)
	}
}
