## Staring

```

bundle install

```

### Concerns

- The bcrypt helps a lot when without devise is a requirement, it even has built-in salts to avoid massive crack

- It would be better to implement the user online state detection with websocket, rather than expose a flood vulnerable and easily manipulated api to clients. But time is the issue here.

- Redis may be the better backend persistence part than a Stranger table with DB, not because it's fast, in-memory read, auto expiration key can be useful in this assignment. But I decided to not use redis to have less dependences.

- If a user or stranger have not visit the page more than 3 minutes, the system would consider its offline.
