# How bots work

|            |                                                                                                                                                                                                     |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Applies to | SDK v4                                                                                                                                                                                              |
| Based on   | [Microsoft Docs](https://docs.microsoft.com/en-us/azure/bot-service/bot-builder-basics?view=azure-bot-service-4.0&tabs=javascript) and its [GitHub repo](https://github.com/MicrosoftDocs/bot-docs) |
| TODO       | Keep fetching changes from their GitHub Repo to update your notes.                                                                                                                                  |

---

## Table Of Contents

- [How bots work](#how-bots-work)
  - [Table Of Contents](#table-of-contents)
  - [Activity](#activity)
    - [Activity Flow](#activity-flow)
      - [HTTP details](#http-details)
      - [Defining a turn](#defining-a-turn)
    - [Activity Types](#activity-types)
      - [Conversation Update Activity](#conversation-update-activity)
      - [Message Activity](#message-activity)
    - [Activity Processing Stack](#activity-processing-stack)
  - [Resources on corresponding microsoft document](#resources-on-corresponding-microsoft-document)

---

## Activity

- Every { ***channels*** <-> ***bot*** } interactions generates an `activity`.

### Activity Flow

#### HTTP details

`Bot Framework Service` sends info. b/w { ***channels*** <-> ***bot*** } via separate HTTP POST requests.

<!-- TODO: Update the ActivityFlow.png image when you update this code
```nomnoml
[USER (channel)]->[Azure Bot Service | [Bot Framework Service]]
[Azure Bot Service | [Bot Framework Service]]->[USER (channel)]
[Azure Bot Service | [Bot Framework Service]]->[BOT]
[BOT]->[Azure Bot Service |[Bot Framework Service]]
```
-->

<!-- Extra image created since the above code doesn't render on GitHub -->
<img src="../../resources/images/ActivityFlow.png" alt="ActivityFlow" width="250"/>

Both are acknowledged with 200 HTTP status code.

> **Little confused about bold text in here:** The protocol doesn’t specify the order in which these POST requests and their acknowledgments are made. However, to fit with common HTTP service frameworks, typically these requests are nested, meaning that the outbound HTTP request is made from the bot **within the scope of the inbound HTTP request**. This pattern is illustrated in the diagram above. Since there are two distinct HTTP connections back to back, **the security model must provide for both.**

<img src="../../resources/images/ConversationUpdateandMessage.png" alt="ConversationUpdateandMessage" width="500"/>

#### Defining a turn

- **Turn:** Think of it as processing associated with the arrival of a given activity
- `turn context` provide info about:
  - sender
  - receiver
  - channel
  - other data needed to process the activity
- `turn context` is one of the most important abstractions in the SDK.
- It carries/provides mechanism for sending:
  - ***inbound activity*** to `middleware components` + `application logic`
  - ***outbound activities*** from `middleware components` + `application logic`

### Activity Types

#### Conversation Update Activity

- (httpDiagram below) On start, 2 ***conversation update*** activities when:
  - User joins (via channel)
  - Bot joins
- To distinguish these activities, check whether `members added` property includes a member other than the ***bot***.

#### Message Activity

A ***Message Activity*** could carry:

- Text
- Text-to-be-spoken
- Suggested actions
- Cards

### Activity Processing Stack

<img src="../../resources/images/bot-builder-activity-processing-stack.png" alt="ConversationUpdateandMessage" width="500"/>

## Resources on corresponding microsoft document

- [Welcoming the user](https://docs.microsoft.com/en-us/azure/bot-service/bot-builder-welcome-user?view=azure-bot-service-4.0)
