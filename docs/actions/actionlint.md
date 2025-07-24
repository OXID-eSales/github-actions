# actionlint

This action runs a static checker for GitHub Actions workflow files.

## Inputs

**config_file** *optional*, *default:* `.actionlint.yaml`  
Specifies the name of the config file to parse, overriding the default.

**custom_configuration** *required*
A custom configuration for the linter. The default values are defined in
`default_light.yaml` as follows:

```yaml
custom_config: |
    self-hosted-runner:
      labels:
        - arc-runner-set
```

**output_artifact** *optional*, *default:* `actionlint`  
Name of the GitHub Actions artifact where the output files will be stored.

**output_path** *optional*, *default:* ''  
List of additional files to include in the uploaded artifact.

## Outputs

Summary of the lint result.