'Run simulation.

Usage:
  run_simulation.R --instructions=<instructions-file> [--log=<log-file>]
  run_simulation.R (-h | --help)
  run_simulation.R --version

Options:
  -h --help     Show this screen.
  --version     Show version.
  --instructions=<file-path>  Path for yaml file with simulation instructions.

' -> doc

arguments <- docopt::docopt(doc, version = '0.0.1')
instructions <- yaml::read_yaml(arguments[['instructions']])
params <- names(instructions)

if (!("call" %in% params)) {
  msg <- "Mandatory instruction missing: 'call'"
  stop(msg)
}

if (!("output" %in% params)) {
  msg <- "Mandatory instruction missing: 'output'"
  stop(msg)
}

if ("log" %in% params) {
  logfile <- instructions[['log']]
  if (file.exists(logfile)) file.remove(logfile)
  logger::log_appender(logger::appender_tee(logfile))
  logger::log_threshold(logger::DEBUG)
  msg <- paste0("Logging into file: ", logfile)
  logger::log_info(msg)
}

msg <- paste0(
  "Running script call:\n",
  instructions[['call']]
)
logger::log_info(msg)

run_attempt <- try(
  system2(instructions[['call']]),
  silent = TRUE
)

has_error <- {
  class(run_attempt) == "try-error" | (is.integer(run_attempt) & run_attempt > 0)
}

if (has_error) {
  msg <- "FATAL: simulation run failed."
  logger::log_error(msg)
} else {
  msg <- "Simulation run successfully completed."
  logger::log_info(msg)
}
