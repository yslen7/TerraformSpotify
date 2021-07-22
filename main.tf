terraform {
  required_providers {
    spotify = {
      version = "~> 0.1.5"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_playlist" "playlist" {
  name        = "Terraform Summer Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    data.spotify_search_track.T.tracks[0].id,
    data.spotify_search_track.A.tracks[1].id,
    data.spotify_search_track.K.tracks[2].id,
    data.spotify_search_track.E.tracks[0].id,
    data.spotify_track.C.id,
    data.spotify_track.A.id,
    data.spotify_track.R.id,
    data.spotify_track.E.id
  ]
}

data "spotify_search_track" "T" {
  artists = ["You me at six"]
  name    = "Take on the world"
}

data "spotify_search_track" "A" {
  name = "Andas en mi cabeza"
}

data "spotify_search_track" "K" {
  name = "Kilómetros"
}

data "spotify_search_track" "E" {
  name    = "Endless Summer"
  artists = ["Grizfolk"]
}

data "spotify_track" "C" {
  url = "https://open.spotify.com/track/7gfZYsX0TVWf6RlMOyV9RB?si=fcea7a49908b41f2"
}

data "spotify_track" "A" {
  url = "https://open.spotify.com/track/0untRI7ZsAYhRBEUWV5pix?si=26669a0f08544a0d"
}

data "spotify_track" "R" {
  url = "https://open.spotify.com/track/26dFgV1OyHnwEGwqpfGmXQ?si=fb9ef6e898ce4aaf"
}

data "spotify_track" "E" {
  url = "https://open.spotify.com/track/2J5tnLbYcsV2SQM5tfZzuT?si=65a55a57ded64754"
}