# Security Policy

## Reporting a vulnerability

If you find a security issue in the MCP server (`mcp/`), the build/CI scripts, or the hosted service at openaccountants.com, please **do not open a public issue**.

Email **info@openaccountants.com** with:

- What you found and where (file, endpoint, or tool name)
- Steps to reproduce
- Impact as you understand it

You'll get an acknowledgment within 2 business days. We'll keep you informed as we triage and fix, and we're happy to credit you publicly once resolved (or keep you anonymous — your call).

## Reporting wrong tax data

A wrong rate or threshold is not a "vulnerability" in the security sense, but it can do real harm. Report it in the open instead — that's the point of this repo:

- [Open a rate-correction issue](https://github.com/openaccountants/openaccountants/issues/new?template=rate-correction.md), or
- Email **info@openaccountants.com** if you prefer

If you're a licensed accountant, corrections you submit are credited to you by name. See [CONTRIBUTING.md](CONTRIBUTING.md).

## Scope notes

- The skills are reference material with a prominent disclaimer; they are not executable code.
- The MCP server runs read-only over bundled markdown and, in hosted mode, calls openaccountants.com APIs. It does not execute skill content.
