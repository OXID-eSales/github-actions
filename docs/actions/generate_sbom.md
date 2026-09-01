# generate_sbom

This action generates a CycloneDX SBOM (Software Bill of Materials) listing the
production dependencies of a Composer project. It installs the
`cyclonedx/cyclonedx-php-composer` plugin globally, resolves the project's
production dependencies, and writes the SBOM file.

## Inputs

**working_directory:** *not required*, *default:* '.'  
Composer project to scan, i.e. the directory containing the composer.json.

**spec_version:** *not required*, *default:* '1.4'  
CycloneDX specification version. BSI TR-03183-2 requires at least 1.4.

**output_format:** *not required*, *default:* 'JSON'  
SBOM output format, either JSON or XML.

**output_file:** *not required*, *default:* 'sbom.json'  
Name of the SBOM file, written inside working_directory.

## Outputs

**sbom_path:**  
Path to the generated SBOM file, for the caller to upload or publish.
