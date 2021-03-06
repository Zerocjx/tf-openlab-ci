
def gitUrl = 'https://github.com/tungstenfabric/tf-openlab-ci.git'

pipelineJob('nightly_intel_testbed') {
    scm {
      git {
        remote {
          url(gitUrl)
          name("origin")
        }
        branch("*/master")
      }
    }

    triggers {
        scm('H 0 * * *')
        cron('H 0 * * *')
    }
    
    definition {
        cpsScm {
            scm {
                    git {
                    remote {
                        url(gitUrl)
                        name("origin")
                    }
                    branch("*/master")
                    extensions { }
                }
            }
            scriptPath("./pipeline/intel_testbed.jenkinsfile")
        }
    }
}

listView('nightly_jobs') {
    columns {
        weather()
        status()
        name()
        lastFailure()
        lastSuccess()
        lastDuration()
        progressBar()
        nextPossibleLaunch()
    }

    jobs {
        name('nightly_intel_testbed')
    }
}
