
def ciUrl =  'https://github.com/zerocjx/tf-openlab-ci.git'
def vrouterUrl = 'https://github.com/Juniper/contrail-vrouter.git'

pipelineJob('weekly_intel_testbed') {
    scm {
      git {
        remote {
          url(vrouterUrl)
          name("origin")
        }
        branch("*/R5.0")
      }
    }

    triggers {
        scm('H 0 * * 5')
        cron('H 0 * * 5')
    }
    
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url(ciUrl)
                        name("origin")
                    }
                    branch("*/dev")
                    extensions { }
                }
            }
            scriptPath("./pipeline/intel_testbed.jenkinsfile")
        }
    }
}

listView('weekly_jobs') {
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
        name('weekly_intel_testbed')
    }
}
