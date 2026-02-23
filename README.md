# Server configs

## Secrets

The generic secrets are stored in secrets.age, these can be regenerated using:
```bash
curl https://github.com/SludgeGirl.keys | age -R - secrets > secrets.age
```

They can also be unencrypted by:
```bash
age -d -i YOUR_IDENTITY_FILE secrets.age
```

You can add the filter and smudge by:
```bash
git config filter.secrets.clean "./secrets_smudge.bash clean"
git config filter.secrets.smudge "./secrets_smudge.bash smudge"
git config filter.secrets.required true
```
