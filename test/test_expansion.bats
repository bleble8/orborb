#!/usr/bin/env bats

# load custom assertions and functions
load bats_helper


# setup is run beofre each test
function setup {
  INPUT_PROJECT_CONFIG=${BATS_TMPDIR}/input_config-${BATS_TEST_NUMBER}
  PROCESSED_PROJECT_CONFIG=${BATS_TMPDIR}/packed_config-${BATS_TEST_NUMBER} 
  JSON_PROJECT_CONFIG=${BATS_TMPDIR}/json_config-${BATS_TEST_NUMBER} 
	echo "#using temp file ${BATS_TMPDIR}/"

  # the name used in example config files.
  INLINE_ORB_NAME="orborb"
}



@test "Command: Test command is correct for inline" {
  # given
  process_config_with test/inputs/default.yml

  # when
  assert_jq_match '.jobs | length' 3
  assert_jq_match '.jobs["Unit Tests"].steps[-1].run.name' "Run Tests using BATS"
  run jq -r '.jobs["Unit Tests"].steps[-1].run.command' $JSON_PROJECT_CONFIG

  assert_contains_text "bats test"

  assert_text_not_found "BATS_IMPORT_DEV_ORB"

}


@test "Command: Test command is correct for import" {
  # given
  process_config_with test/inputs/import-test.yml

  # when
  assert_jq_match '.jobs | length' 3
  assert_jq_match '.jobs["Unit Tests"].steps[-1].run.name' 'Run Tests using BATS using eddiewebb/orborb@dev:${PR_NUMBER}'

  run jq -r '.jobs["Unit Tests"].steps[-1].run.command' $JSON_PROJECT_CONFIG
  assert_contains_text "BATS_IMPORT_DEV_ORB"
  assert_contains_text "bats test"

}
