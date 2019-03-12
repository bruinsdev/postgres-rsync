# PostgreSQL with Rsync

Tiny docker image with PostgreSQL 11, rsync and openssh

# Start container

In `docker-compose.yml`:

```yml
  postgres:
    image: andreas4all/postgres-rsync:latest
    volumes:
      - ./postgres/11/data:/var/lib/postgresql/data
      - ./postgres/11/.ssh:/var/lib/postgresql/.ssh
```

# How to use

In running container:

```bash
chown postgres:postgres /var/lib/postgresql/.ssh
su postgres
ssh-keyscan example.com >> ~/.ssh/known_hosts
ssh-keygen -t rsa
```


Copy `id_rsa.pub` into your server `barman` user account (`/home/barman/.ssh/authorized_keys`)
