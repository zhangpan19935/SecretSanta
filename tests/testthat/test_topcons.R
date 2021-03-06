context("Check TOPCONS integration")

test_that("TOPCONS outputs are integrated seamlessly",
          {
              # prep inputs:
              aa <- readAAStringSet(
                  system.file("extdata",
                              "sample_prot_100.fasta",
                              package = "SecretSanta"),
                  use.names = TRUE
              )
              p_dir <- system.file("extdata",
                                   "rst_SVw4hG.zip",
                                   package = "SecretSanta")
              
              inp <- CBSResult(in_fasta = aa)
              
              # try to input AAstringSet object:
              expect_error(topcons(input_obj = aa,
                             parse_dir = p_dir,
                             topcons_mode = "WEB-server",
                             TM = 0,
                             SP = FALSE),
                           "Input object does not belong to CBSResult class.")
              
              # try to input CBSResult object with empty out_fasta slot
              
              expect_error(topcons(input_obj = inp,
                                   parse_dir = p_dir,
                                   topcons_mode = 'WEB-server',
                                   TM = 0),
                                   'out_fasta slot is empty.')
              # wrong file path
              expect_error(topcons(input_obj = inp,
                                   parse_dir = paste(p_dir, '000', sep = ''),
                                   topcons_mode = 'WEB-server',
                                   TM = 0),
              'Please provide valid path to the zipped TOPCONS output')
              
              # create some meaningful CBSResult object
              sp <-
                  signalp(inp,
                          version = 2,
                          organism = 'euk',
                          run_mode = "starter",
                          legacy_method = 'hmm')
              
              tpc <- topcons(input_obj = sp,
                             parse_dir = p_dir,
                             topcons_mode = "WEB-server",
                             TM = 0, SP = TRUE)
              
              expect_error(topcons(input_obj = sp,
                      parse_dir = p_dir,
                      topcons_mode = "WEB-server",
                      TM = 0,
                      SP = 1),
                      "SP argument must be a logical.")
              
              expect_warning(topcons(input_obj = sp,
                             parse_dir = p_dir,
                             topcons_mode = "WEB-server",
                             TM = 2,
                             SP = FALSE),
                             "Recommended TM threshold value for secreted peptides is 0.")
              
              expect_is(tpc, 'TopconsResult')
              expect_true(nrow(getTOPtibble(tpc)) == 9)
              
              
              # test stand-alone mode
              q_file  <- system.file("extdata", "multiple_seqs/query.fasta", 
                                     package = "SecretSanta")
              
              inp2 <- CBSResult(in_fasta = readAAStringSet(q_file))
              
              dir_to_parse <- dirname(q_file)

              
              sp2 <- signalp(inp2,
                             version = 2,
                             organism = 'euk',
                             run_mode = "starter",
                             legacy_method = 'hmm')
              
              expect_is(topcons(input_obj = sp2,
                      parse_dir = dir_to_parse,
                      topcons_mode = "stand-alone",
                      TM = 0, SP = FALSE), 'TopconsResult')
              
              
              expect_warning(topcons(input_obj = sp2,
                                parse_dir = dir_to_parse,
                                topcons_mode = "stand-alone",
                                TM = 7, SP = FALSE))
              })


