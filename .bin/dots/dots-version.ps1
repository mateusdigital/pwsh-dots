
##------------------------------------------------------------------------------
$PROGRAM_NAME            = "dots";
$PROGRAM_VERSION         = "5.0.0";
$PROGRAM_AUTHOR          = "mateus.digital - <hello@mateus.digital>";
$PROGRAM_COPYRIGHT_OWNER = "mateus.digital";
$PROGRAM_COPYRIGHT_YEARS = "2021 - 2025";
$PROGRAM_DATE            = "30 Nov, 2021";
$PROGRAM_LICENSE         = "GPLv3";


##------------------------------------------------------------------------------
$output = @(
    "${PROGRAM_NAME} - ${PROGRAM_VERSION} - ${PROGRAM_AUTHOR}"
    "Copyright (c) ${PROGRAM_COPYRIGHT_YEARS} - ${PROGRAM_COPYRIGHT_OWNER}"
    "This is a free software (${PROGRAM_LICENSE}) - Share/Hack it"
    "Check https://mateus.digital for more :)"
) -join "`n";

Write-Output "$output";