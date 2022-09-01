# Backup git to S3 Action

This action will compress and backup a given git repository to S3.

## Usage

```yaml
  backup:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo to be backed up
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
          path: repo-to-backup
          github_token: ${{ secrets.GITHUB_TOKEN }}

      - name: Backup repo to s3
        uses: sammcj/backup-git-to-s3-action@main
        with:
          s3-bucket: 'my-s3-bucket-name'
          s3-prefix: 'githubRepoBackup'
          s3-region: 'ap-southeast-2'
          repository-path: 'repo-to-backup'
```

## Inputs

```yaml
  s3-bucket:
    type: string
    required: true
    description: 'The S3 bucket name'
  s3-prefix:
    type: string
    required: false
    description: 'The S3 prefix to use for the backup'
    default: 'githubRepoBackup'
  s3-region:
    type: string
    required: false
    description: 'The S3 region to use for the backup'
    default: 'ap-southeast-2'
  repository-name:
    type: string
    required: false
    description: 'The name of the repository to backup, defaults to the current repository name'
  repository-path:
    type: string
    required: false
    description: 'The temporary path for the repository to clone and backup, defaults to ./repo-to-backup/'
    default: './repo-to-backup/'
  temp-dir:
    type: string
    required: false
    description: 'The temporary directory to use for the backup, defaults to /tmp'
    default: '/tmp'
  tar-command:
    type: string
    required: false
    description: 'The tar command to use to compress the git repo, defaults to tar -czvf'
    default: 'tar -czvf'
```

## Assumptions

- You are authenticated to AWS.
  - e.g. [AWS configure-aws-credentials Action](https://github.com/aws-actions/configure-aws-credentials)
- You have the correct permissions to write to the S3 bucket.
- You can run the aws cli (e.g. `aws s3 ls`).
- You have tar installed (e.g. `tar --version`).
