# Node Vertex Homebrew Tap

Install the Node Vertex CLI in one command.

```bash
brew tap drlockett/tap
brew install nv
nv enroll
```

`nv enroll` prints an activation code, directs you to `https://login.nodevertex.com/activate`, and waits until browser approval completes. New email identities must verify email before creating vertices.

Quick check:

```bash
nv --version
nv --agent
```
